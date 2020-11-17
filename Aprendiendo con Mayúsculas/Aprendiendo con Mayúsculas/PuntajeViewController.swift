//
//  PuntajeViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by user178735 on 10/14/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit
import Social

class PuntajeViewController: UIViewController {
    let image: UIImage = UIImage(named: "btContactoImage1")!

    @IBAction func buttonAction(_ sender: Any)
    {
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var lbCorrecto: UILabel!
    let defaults = UserDefaults.standard
    var correcto : Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        let puntos = defaults.integer(forKey: "puntos")
        lbPuntos.text = String(puntos)
        if (correcto) {
            lbCorrecto.text = "¡Correcto!"
        } else {
            lbCorrecto.textColor = UIColor.red
            lbCorrecto.text = "Incorrecto"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
