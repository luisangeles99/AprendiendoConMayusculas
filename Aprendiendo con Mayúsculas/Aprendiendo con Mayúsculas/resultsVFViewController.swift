//
//  resultsVFViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 19/11/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit
import Social

class resultsVFViewController: UIViewController {

    //VARIABLES
    var aciertos : Int!
    var preguntas : Int!
    let defaults = UserDefaults.standard

    
    //OUTLETS
    @IBOutlet weak var labelMensaje: UILabel!
    @IBOutlet weak var labelPuntuacion: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Puntuación"
        
        imagen.image = UIImage(named: "question")
        labelMensaje.text = "Observa tus resultados y comprueba si debes seguir estudiando."
        labelPuntuacion.text = "Tuviste " + String(aciertos) + " / " + String(preguntas) + " lo que equivale a " + String(format: "%.2f",(Double(aciertos)/Double(preguntas))*100)
        self.navigationItem.setHidesBackButton(true, animated: true)
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

    @IBAction func btnAceptar(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: ViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
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
