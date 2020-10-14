//
//  BasicoVFViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 13/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class BasicoVFViewController: UIViewController {

    @IBOutlet weak var txtProblema: UILabel!
    var arrDiccionarios: NSArray!
    let defaults = UserDefaults.standard
    var bCorrecto: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource:"Property List", ofType: "plist")
        arrDiccionarios = NSArray(contentsOfFile: path!)
        let problema = arrDiccionarios[0] as! NSDictionary
        txtProblema.text = problema["Problema"] as! String
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func falseBtn(_ sender: UIButton) {
        let problema = arrDiccionarios[0] as! NSDictionary
        print(problema)
        if  false == (problema["Respuesta"] as! Bool){
            print("correcto")
            bCorrecto = true
        }else{
            print("incorrecto")
            bCorrecto = false
        }
    }
    
    @IBAction func trueBtn(_ sender: UIButton) {
        let problema = arrDiccionarios[0] as! NSDictionary
        print(problema)
        if  true == (problema["Respuesta"] as! Bool){
            print("correcto")
            bCorrecto = true
            defaults.setValue(defaults.integer(forKey: "puntos") + 100, forKey: "puntos")
        }else{
            print("incorrecto")
            bCorrecto = false
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let puntajeView = segue.destination as! PuntajeViewController
        puntajeView.correcto = bCorrecto
    }
    

}
