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
    var botones : [UIButton] = []
    var currPregunta = 0
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Label Título
        tituloLabel.text = tema
        tituloLabel.font.withSize(20)
        
        
        
        //Array Botonoes
        botones.append(respuesta1)
        botones.append(respuesta2)
        botones.append(respuesta3)
        botones.append(respuesta4)
        
        //Tags botones
        for i in 1...botones.count{
            botones[i-1].tag = i
        }
        
        //Get info
        obtenerInfo()
        
        //Preguntas del tema
        infoArray = infoPlist[indice] as? NSArray
        
        loadPregunta(curr: currPregunta)
        loadRespuestas()
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Quiz Functions
    @IBAction func btnAnswer(sender : UIButton){
        let color = sender.backgroundColor
        switch sender.tag {
        case 1:
            print("Btn 1 presionado")
            break
        case 2:
            print("Btn 2 presionado")
            break
        case 3:
            print("Btn 3 presionado")
            break
        case 4:
            print("Btn 4 presionado")
            break
        default:
            print("Error")
        }
        sender.backgroundColor = UIColor.white
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.checkAnswer(index: sender.tag-1, btn: sender)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            sender.backgroundColor = color
            self.loadNextQuestion()
        }
        
    }
    
    func checkAnswer(index : Int, btn : UIButton){
        respuestasDetalle = respuestas[index] as? NSArray
        if (respuestasDetalle[1] as? Bool)! {
            print("Respuesta Correcta")
            btn.backgroundColor = UIColor.green
        }
        else{
            print("Respuesta Incorrecta")
            btn.backgroundColor = UIColor.red
        }
        
        
    }
    
    func loadNextQuestion(){
        if currPregunta < 4 {
            currPregunta = currPregunta + 1
            loadPregunta(curr: currPregunta)
            loadRespuestas()
        }
        else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                _ = self.navigationController?.popViewController(animated: true)

            }
            
        }
    }
    

    //MARK: - Obtener Temas del plist
    @IBAction func obtenerInfo(){
        let path = Bundle.main.path(forResource:"trivia", ofType: "plist")
        infoPlist = NSArray(contentsOfFile: path!)
    }
    
    //MARK: - Load Respuestas
    func loadPregunta(curr : Int){
        infoPregunta = infoArray[curr] as? NSDictionary
        respuestas = infoPregunta["Respuestas"] as? NSArray
        
        //cargar info
        pregunta.text = infoPregunta["Pregunta"] as? String
    }
    
    
    func loadRespuestas(){
        for i in 0...botones.count-1{
            respuestasDetalle = respuestas[i] as? NSArray
            btnTitle = respuestasDetalle[0] as? String
            botones[i].setTitle(btnTitle, for: .normal)
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
