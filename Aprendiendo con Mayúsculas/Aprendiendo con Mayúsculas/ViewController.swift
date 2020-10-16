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
        
        title = minmay
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTeoria"{
            let vistaTeoria = segue.destination as! NormaController
            vistaTeoria.tema = tema
        }else if segue.identifier == "segueEjemplos"{
            let vistaEjemplos = segue.destination as!EjemploViewController
            vistaEjemplos.tema = tema
        }
    }


}

