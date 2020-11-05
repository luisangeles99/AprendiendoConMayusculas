//
//  TriviaViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 03/11/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit
import SwiftUI
import SimpleRoulette

class TriviaViewController: UIViewController {


    @IBOutlet var rouletteView: RouletteView!
    var spin : Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        spin = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trivia"
        
        rouletteView.delegate = self
        rouletteView.configure(parts: [
            Roulette.HugePart(name: "Oraciones", huge: .normal, delegate: rouletteView, index: 0),
            Roulette.HugePart(name: "Párrafos", huge: .normal, delegate: rouletteView, index: 1),
            Roulette.HugePart(name: "Títulos", huge: .normal, delegate: rouletteView, index: 2),
            Roulette.HugePart(name: "Nombres", huge: .normal, delegate: rouletteView, index: 3),
            Roulette.HugePart(name: "Sorpresa", huge: .normal, delegate: rouletteView, index: 4),
        ])
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Métodos De Trivia
    
    func playRoulette() {
        let valor = Double.random(in: 2...6)
        print(valor)
        rouletteView.start()
        DispatchQueue.main.asyncAfter(deadline: .now() + valor) {
            self.rouletteView.stop()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + valor + 1.5) {
            
            self.performSegue(withIdentifier: "playSegue", sender: nil)
        }
        
    }
    
    
    
    @IBAction func spinRoulette(_ sender: Any) {
        playRoulette()
        
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    
        
        
    }

    
}






extension TriviaViewController: RouletteViewDelegate {
    func rouletteView(_ rouletteView: RouletteView, didStopAt part: RoulettePartType) {
        /*
        let alert = UIAlertController(title: "Elegido", message: part.name, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Valor", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        rouletteView.configure(parts: [
            Roulette.HugePart(name: "Oraciones", huge: .normal, delegate: rouletteView, index: 0),
            Roulette.HugePart(name: "Párrafos", huge: .normal, delegate: rouletteView, index: 1),
            Roulette.HugePart(name: "Títulos", huge: .normal, delegate: rouletteView, index: 2),
        ])
        */
        
        
    }
}
