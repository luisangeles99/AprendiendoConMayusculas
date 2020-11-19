//
//  creditosViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 18/11/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class creditosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Créditos"
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //Modo Portrait
       override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return UIInterfaceOrientationMask.landscape
       }
       override var shouldAutorotate: Bool {
           return false
       }

    
}
