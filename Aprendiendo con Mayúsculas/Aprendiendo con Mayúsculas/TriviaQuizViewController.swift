//
//  TriviaQuizViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 04/11/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class TriviaQuizViewController: UIViewController {

    //Plist variables
    var infoPlist : NSArray!
    var infoArray : NSArray!
    var infoPregunta : NSDictionary!
    var respuestas : NSArray!
    var respuestasDetalle : NSArray!
    
    //Outlets from View
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var pregunta: UILabel!
    @IBOutlet weak var respuesta1: UIButton!
    @IBOutlet weak var respuesta2: UIButton!
    @IBOutlet weak var respuesta3: UIButton!
    @IBOutlet weak var respuesta4: UIButton!
    
    //Info coming from Segue
    var tema : String!
    var indice : Int!
    
    //Variables
    var btnTitle : String!
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController?.navigationBar.isHidden = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tituloLabel.text = tema
        tituloLabel.font.withSize(20)
        obtenerInfo()
        infoArray = infoPlist[indice] as? NSArray
        infoPregunta = infoArray[0] as? NSDictionary
        respuestas = infoPregunta["Respuestas"] as? NSArray
        
        //cargar info
        pregunta.text = infoPregunta["Pregunta"] as? String
        
        //respuesta 1
        respuestasDetalle = respuestas[0] as? NSArray
        btnTitle = respuestasDetalle[0] as? String
        respuesta1.setTitle(btnTitle, for: .normal)
        //respuesta 2
        respuestasDetalle = respuestas[1] as? NSArray
        btnTitle = respuestasDetalle[0] as? String
        respuesta2.setTitle(btnTitle, for: .normal)
        //respuesta 3
        respuestasDetalle = respuestas[2] as? NSArray
        btnTitle = respuestasDetalle[0] as? String
        respuesta3.setTitle(btnTitle, for: .normal)
        //respuesta 4
        respuestasDetalle = respuestas[3] as? NSArray
        btnTitle = respuestasDetalle[0] as? String
        respuesta4.setTitle(btnTitle, for: .normal)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    

    //MARK: - Obtener Temas del plist
    @IBAction func obtenerInfo(){
        let path = Bundle.main.path(forResource:"trivia", ofType: "plist")
        infoPlist = NSArray(contentsOfFile: path!)
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
