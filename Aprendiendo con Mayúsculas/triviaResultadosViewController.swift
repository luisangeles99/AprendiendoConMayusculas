//
//  triviaResultadosViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 16/11/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class triviaResultadosViewController: UIViewController {

    //imgs
    let imgs : [String] = ["results", "results1", "results2"]
    
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var tiempoLabel: UILabel!
    @IBOutlet weak var puntajeLabel: UILabel!
    @IBOutlet weak var mensajeLabel: UILabel!
    var tiempo : Double!
    var aciertos : Int!
    var preguntas : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        puntajeLabel.text = String(aciertos) + " / " + String(preguntas) + " lo que equivale a: " + String((Double(aciertos)/Double(preguntas))*100)
        tiempoLabel.text = "Tu tiempo fue de: " + String(format: "%.2f", tiempo) + " segundos"
        
        
        if aciertos! <= 2 {
            imagen.image = UIImage(named: imgs[1])
            mensajeLabel.text = "¡Debes esforzarte un poco más!"
        }else if aciertos! <= 4{
            imagen.image = UIImage(named: imgs[0])
            mensajeLabel.text = "¡Estás cerca de ser un maestro!"
        }else{
            imagen.image = UIImage(named: imgs[2])
            mensajeLabel.text = "¡Eres todo un maestro en el uso de mayúsculas!"
        }
        
        // Do any additional setup after loading the view.
    }
    
    //Modo Portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool {
        return false
    }
    

    
    
    
    // MARK: - Navigation

    @IBAction func btnAceptar(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
