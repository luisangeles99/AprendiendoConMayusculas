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

    
    //outlets
    @IBOutlet weak var txtProblema: UILabel!
    @IBOutlet weak var btnIncorrecto: UIButton!
    @IBOutlet weak var btnCorrecto: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    //Info vars
    var arrDiccionarios: NSDictionary!
    let defaults = UserDefaults.standard
    var bCorrecto: Bool = false
    var problemasDisp : NSMutableArray!
    var problema: NSDictionary!
    var tema : String!
    var categoria : String!
    var currPregunta: Int = 0
    var aciertos: Int  = 0
    
    //Sound effects
    var player : AVAudioPlayer!
    let urlString = Bundle.main.path(forResource: "acierto", ofType: "mp3")
    let urlString2 = Bundle.main.path(forResource: "error", ofType: "mp3")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(tema!)
        title = "Práctica C/I"
        
        //Load Info
        loadInfo()
        
        loadPregunta(curr: currPregunta)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let x = Int.random(in: 0..<problemasDisp.count)
        problema = problemasDisp[x] as? NSDictionary
        txtProblema.text = problema["Problema"] as? String
    }
    
    
    @IBAction func btnAnswer(_ sender: UIButton){
        var corrIncorr = false
        switch sender.tag {
        case 0:
            corrIncorr = true
            break
        case 1:
            corrIncorr = false
            break
        default:
            break
        }
        //Checar Respuesta
        if corrIncorr == problema["Respuesta"] as? Bool{
            print("Correcto")
            bCorrecto = true
            defaults.setValue(defaults.integer(forKey: "puntos") + 100, forKey: "puntos")
            play(acierto: true)
            aciertos = aciertos + 1
        }else{
            play(acierto: false)
            bCorrecto = false
            print("Incorrecto")
        }
        currPregunta = currPregunta + 1
        btnCorrecto.isEnabled = false
        btnIncorrecto.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.loadPregunta(curr: self.currPregunta)
        }
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = segue.destination as! resultsVFViewController
        
        view.aciertos = aciertos
        view.preguntas = problemasDisp.count
        
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
    
    //MARK:- Load Info/Preguntas
    func loadInfo(){
        let path = Bundle.main.path(forResource:"Property List", ofType: "plist")
        arrDiccionarios = NSDictionary(contentsOfFile: path!)
        let  tema2 = arrDiccionarios[tema!] as! NSDictionary
        let  tipo = tema2["Basico"] as! NSDictionary
        problemasDisp = tipo["verdaderoFalso"] as? NSMutableArray
        
    }
    
    func loadPregunta(curr: Int){
        if currPregunta < problemasDisp.count {
            problema = problemasDisp[curr] as? NSDictionary
            txtProblema.text = problema["Problema"] as? String
            btnCorrecto.isEnabled = true
            btnIncorrecto.isEnabled = true
        }else{
            performSegue(withIdentifier: "showResults", sender: nil)
        }
    }
    
    
    //MARK:- Load Next Question
    
    
    
    
    //MARK: - Portrait Mode
    //Modo Portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool {
        return false
    }
    

}
