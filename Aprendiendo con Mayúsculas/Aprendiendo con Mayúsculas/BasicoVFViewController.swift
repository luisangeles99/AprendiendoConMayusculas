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
    var arrDiccionarios: NSDictionary!
    let defaults = UserDefaults.standard
    var bCorrecto: Bool = false
    var problemasDisp : NSMutableArray!
    var problema: NSDictionary!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Práctica Básica"
        let path = Bundle.main.path(forResource:"Property List", ofType: "plist")
        arrDiccionarios = NSDictionary(contentsOfFile: path!)
        let  tema = arrDiccionarios["Nombres propios"] as! NSDictionary
        let  tipo = tema["Basico"] as! NSDictionary
        let problemas = tipo["verdaderoFalso"] as! NSMutableArray
        problemasDisp = problemas
        var x = Int.random(in: 0..<problemas.count)
        problema = problemas[x] as? NSDictionary
        txtProblema.text = problema["Problema"] as? String
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var x = Int.random(in: 0..<problemasDisp.count)
        problema = problemasDisp[x] as! NSDictionary
        txtProblema.text = problema["Problema"] as! String
    }
    
    @IBAction func falseBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func trueBtn(_ sender: UIButton) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let puntajeView = segue.destination as! PuntajeViewController
        let boton = sender as! UIButton
        if(boton.restorationIdentifier == "btTrue"){
            print(problema)
            if  true == (problema["Respuesta"] as! Bool){
                print("correcto")
                bCorrecto = true
                defaults.setValue(defaults.integer(forKey: "puntos") + 100, forKey: "puntos")
                
            }else{
                print("incorrecto")
                bCorrecto = false
            }
        } else {
            print(problema)
            if  false == (problema["Respuesta"] as! Bool){
                print("correcto")
                bCorrecto = true
            }else{
                print("incorrecto")
                bCorrecto = false
            }
        }
        puntajeView.correcto = bCorrecto
    }
    

}
