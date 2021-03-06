//
//  ViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 12/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var minmay : String!
    var tema : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = tema
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTeoria"{
            let vistaTeoria = segue.destination as! NormaController
            vistaTeoria.tema = tema
            vistaTeoria.categoria = minmay
        }else if segue.identifier == "segueEjemplos"{
            let vistaEjemplos = segue.destination as!EjemploViewController
            vistaEjemplos.tema = tema
            vistaEjemplos.categoria = minmay
        }else if segue.identifier == "seguePractica"{
            let vistaPractica = segue.destination as! PickerExerciseViewController
            vistaPractica.tema = tema
            vistaPractica.categoria = minmay
        }
    }

    //Modo Portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool {
        return false
    }
    
}

