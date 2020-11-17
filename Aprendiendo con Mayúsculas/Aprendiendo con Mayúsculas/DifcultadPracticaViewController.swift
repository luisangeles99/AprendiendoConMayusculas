//
//  DifcultadPracticaViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 13/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class DifcultadPracticaViewController: UIViewController {
    var tema : String!
    var categoria : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaPickerExercise = segue.destination as! PickerExerciseViewController
        vistaPickerExercise.tema = tema
        vistaPickerExercise.categoria = categoria
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
