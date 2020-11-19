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


    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet var rouletteView: RouletteView!
    var spin : Bool = false
    //var nombresTemas : [String] = ["Oraciones", "Párrafos", "Títulos", "Nombres", "Sorpresa"]
    var indice : Int!
    var tema : String!
    
    override func viewWillAppear(_ animated: Bool) {
        spin = false
        self.navigationController?.navigationBar.isHidden = false

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
        let valor = Double.random(in: 1...7)
        print(valor)
        rouletteView.start()
        DispatchQueue.main.asyncAfter(deadline: .now() + valor) {
            self.rouletteView.stop()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + valor + 1.5) {
            self.performSegue(withIdentifier: "playSegue", sender: nil)
            self.btnPlay.isEnabled = true
        }
        
    }
    
    
    
    @IBAction func spinRoulette(_ sender: UIButton) {
        playRoulette()
        btnPlay.isEnabled = false
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let view = segue.destination as! TriviaQuizViewController
        view.tema = tema
        view.indice = indice
    
        
        
    }

    
}






extension TriviaViewController: RouletteViewDelegate {
    func rouletteView(_ rouletteView: RouletteView, didStopAt part: RoulettePartType) {
        
        indice = part.index
        tema = part.name
        //part.fillColor = .systemTeal
        
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
    
    //Modo Portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool {
        return false
    }
}
