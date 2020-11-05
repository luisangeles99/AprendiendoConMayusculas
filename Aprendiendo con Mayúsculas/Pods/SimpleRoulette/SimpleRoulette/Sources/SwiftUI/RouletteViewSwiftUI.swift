//
//  RouletteViewSwiftUI.swift
//  SimpleRoulette
//
//  Created by Fumiya Tanaka on 2020/09/30.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import SwiftUI
import UIKit

public struct RouletteViewSwiftUI: View {
    
    @ObservedObject var viewModel: RouletteViewModel
    
    @State private var radius: CGFloat = 0
    @State private var center: CGPoint = .zero
    @State private var currentAngle: Angle = .init()
    
    let pointSize: CGSize = CGSize(width: 32, height: 32)
    let pointView: AnyView
    
    public var body: some View {
        VStack {
            Spacer()
            pointView.frame(width: pointSize.width, height: pointSize.height)
            GeometryReader { geometry in
                self.content
                    .aspectRatio(1, contentMode: .fit)
                    .rotationEffect(self.currentAngle)
                    .onAppear(perform: {
                        let midX = geometry.frame(in: .local).midX
                        let midY = geometry.frame(in: .local).midY
                        let centerValue = min(midX, midY)
                        self.center = CGPoint(x: centerValue, y: centerValue)
                        self.radius = centerValue
                    })
                    .onReceive(self.viewModel.$state, perform: { state in
                        withAnimation(.easeOut(duration: self.viewModel.duration)) {
                            self.currentAngle = state.angle
                        }
                    })
            }
            Spacer()
        }
    }
    
    private var annotations: some View {
        ForEach(viewModel.parts.indices) { (index: Int) -> AnyView in
            let part = self.viewModel.parts[index]
            return AnyView(
                Text(part.name)
                    .offset(CGSize(width: { _ -> CGFloat in
                        let mean = (part.startRadianAngle + part.endRadianAngle) / 2
                        let x: CGFloat = self.radius / 2 * CGFloat(cos(mean))
                        return x
                    }(()), height: { _ -> CGFloat in
                        let mean = (part.startRadianAngle + part.endRadianAngle) / 2
                        let y: CGFloat = self.radius / 2 * CGFloat(sin(mean))
                        return y
                    }(())))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: self.radius * 0.8, maxHeight: self.radius * 0.8)
            )
        }
    }
    
    private var content: some View {
        ForEach(viewModel.parts.indices) { (index: Int) -> RoulettePartSwiftUIView in
            let part = self.viewModel.parts[index]
            return RoulettePartSwiftUIView(
                radius: self.radius,
                center: self.center,
                part: part,
                currentAngle: self.viewModel.state.angle
            )
        }
    }
    
    public init(viewModel: RouletteViewModel, pointView: AnyView? = nil) {
        self.viewModel = viewModel
        if let pointView = pointView {
            self.pointView = pointView
        } else {
            self.pointView = AnyView(Image(systemName: "arrowtriangle.down").font(.system(size: 32)))
        }
    }
}

struct RouletteViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RouletteViewModel(duration: 5)
        viewModel.configureParts([
            Roulette.HugePart(name: "Test A", huge: .normal, delegate: viewModel, index: 0),
            Roulette.HugePart(name: "Test B", huge: .normal, delegate: viewModel, index: 1),
            Roulette.HugePart(name: "Test C", huge: .normal, delegate: viewModel, index: 2),
            Roulette.HugePart(name: "Test D", huge: .normal, delegate: viewModel, index: 3),
        ])
        return RouletteViewSwiftUI(viewModel: viewModel)
    }
}
