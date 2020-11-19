//
//  BasicoVFViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 13/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit
import AVFoundation

class BasicoVFViewController: UIViewController {

    @IBOutlet weak var txtProblema: UILabel!
    var arrDiccionarios: NSDictionary!
    let defaults = UserDefaults.standard
    var bCorrecto: Bool = false
    var problemasDisp : NSMutableArray!
    var problema: NSDictionary!
    var tema : String!
    var categoria : String!
    
    //Sound effects
    var player : AVAudioPlayer!
    let urlString = Bundle.main.path(forResource: "acierto", ofType: "mp3")
    let urlString2 = Bundle.main.path(forResource: "error", ofType: "mp3")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(tema!)
        title = "Práctica C/I"
        let path = Bundle.main.path(forResource:"Property List", ofType: "plist")
        arrDiccionarios = NSDictionary(contentsOfFile: path!)
        let  tema2 = arrDiccionarios[tema!] as! NSDictionary
        let  tipo = tema2["Basico"] as! NSDictionary
        let problemas = tipo["verdaderoFalso"] as! NSMutableArray
        problemasDisp = problemas
        let x = Int.random(in: 0..<problemas.count)
        problema = problemas[x] as? NSDictionary
        txtProblema.text = problema["Problema"] as? String
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let x = Int.random(in: 0..<problemasDisp.count)
        problema = problemasDisp[x] as? NSDictionary
        txtProblema.text = problema["Problema"] as? String
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
        let statusBtn : Bool!
        if boton.restorationIdentifier == "btTrue"{
            statusBtn = true
        }else{
            statusBtn = false
        }
        if statusBtn == problema["Respuesta"] as? Bool{
            print("Correcto")
            bCorrecto = true
            defaults.setValue(defaults.integer(forKey: "puntos") + 100, forKey: "puntos")
            play(acierto: true)
        }else{
            play(acierto: false)
            bCorrecto = false
            print("Incorrecto")
        }
//        if(boton.restorationIdentifier == "btTrue"){
//            //print(problema)
//            if  true == (problema["Respuesta"] as! Bool){
//                print("correcto")
//                bCorrecto = true
//
//
//            }else{
//                print("incorrecto")
//                bCorrecto = false
//            }
//        } else {
//            //print(problema)
//            if  false == (problema["Respuesta"] as! Bool){
//                print("correcto")
//                bCorrecto = true
//            }else{
//                print("incorrecto")
//                bCorrecto = false
//            }
//        }
        puntajeView.correcto = bCorrecto
    }
    
    //MARK: - Sound Effects
    func play(acierto: Bool){
        
        if acierto {
            do{
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString!))
                player.play()
            }catch{
                print("error with audio file!")
            }
        }else{
            do{
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString2!))
                player.play()
            }catch{
                print("error with audio file!")
            }
        }
    }
    
    
    
    //MARK: - Portrait Mode
    //Modo Portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool {
        return false
    }
    

}
