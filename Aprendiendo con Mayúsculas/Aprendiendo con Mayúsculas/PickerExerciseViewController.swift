//
//  PickerExerciseViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by user180585 on 11/16/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class PickerExerciseViewController: UIViewController {

    var tema : String!
    var categoria : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTap"{
            let vistaTap = segue.destination as! ViewControllerTapExercise
            vistaTap.tema = tema
            vistaTap.categoria = categoria
        }else if segue.identifier == "segueVerdadero"{
            let vistaVerdadero = segue.destination as!BasicoVFViewController
            vistaVerdadero.tema = tema
            vistaVerdadero.categoria = categoria
        }
    }
    

}
