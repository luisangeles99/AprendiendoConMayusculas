//
//  ViewControllerTapExercise.swift
//  Aprendiendo con Mayúsculas
//
//  Created by user180585 on 11/1/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit
class ViewControllerTapExercise: UIViewController, UIGestureRecognizerDelegate {


    @IBOutlet weak var numTotals: UILabel!
    @IBOutlet weak var textView: UITextView!
    var indicesCorrectos : NSArray!
    var myString : NSMutableAttributedString!
    var tema : String!
    var categoria : String!
    var myPList : NSDictionary!
    var arrEjercicios : NSArray!
    var ejercicio : NSDictionary!
    var respuestasCorrectasActual : Int!
    var respuestasCorrectas : Int!

    override func viewDidAppear(_ animated: Bool) {
        ejercicio = arrEjercicios[0] as! NSDictionary
        var myStringProblema = ejercicio["ejercicio"] as! String
        indicesCorrectos = ejercicio["indicesCorrectos"] as! NSArray
        
        respuestasCorrectas = indicesCorrectos.count
        respuestasCorrectasActual = 0
        refreshCounter()

        // Create an attributed string
        myString = NSMutableAttributedString(string: myStringProblema)

        // Set an attribute on part of the string
        let myRange = NSRange(location: 0, length: 5) // range of "Swift"
        let myCustomAttribute = [ NSAttributedString.Key.myAttributeName: "some value"]
        myString.addAttributes(myCustomAttribute, range: myRange)
        textView.attributedText = myString
        textView.font = UIFont(name: textView.font!.fontName, size: 25)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource:"Property List", ofType: "plist")
        myPList = NSDictionary(contentsOfFile: path!)
        let cat = myPList[tema!] as! NSDictionary
        //print(tema)
        let dificultad = cat["Basico"] as! NSDictionary
        arrEjercicios = dificultad["tapExercise"] as! NSArray
        ejercicio = arrEjercicios[0] as! NSDictionary
        var myStringProblema = ejercicio["ejercicio"] as! String
        indicesCorrectos = ejercicio["indicesCorrectos"] as! NSArray
        
        respuestasCorrectas = indicesCorrectos.count
        respuestasCorrectasActual = 0
        refreshCounter()

        // Create an attributed string
        myString = NSMutableAttributedString(string: myStringProblema)

        // Set an attribute on part of the string
        let myRange = NSRange(location: 0, length: 5) // range of "Swift"
        let myCustomAttribute = [ NSAttributedString.Key.myAttributeName: "some value"]
        myString.addAttributes(myCustomAttribute, range: myRange)

        textView.attributedText = myString
        textView.font = UIFont(name: textView.font!.fontName, size: 25)

        // Add tap gesture recognizer to Text View
        let tap = UITapGestureRecognizer(target: self, action: #selector(myMethodToHandleTap(_:)))
        tap.delegate = self
        textView.addGestureRecognizer(tap)
    }
    
    func refreshCounter(){
        print(respuestasCorrectasActual)
        numTotals.text = String(respuestasCorrectasActual) + "/" + String(respuestasCorrectas)
        numTotals.font = UIFont(name: numTotals.font!.fontName, size: 25)
    }
    
    func getPalabra(indiceTap : Int) -> Int{
        var indice = 0
        var firstIndex = 0
        for letter in myString.string {
            if(letter == " "){
                firstIndex = indice
            }
            if(indice == indiceTap){
                break
            }
            indice += 1
        }
        return firstIndex + 1

    }
    
    func completedExercise(){
        if respuestasCorrectas == respuestasCorrectasActual{
            print("TESTING")
            performSegue(withIdentifier: "segueCorrecta", sender: nil)
        }
    }
    
    func myReplace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        print(modifiedString)
        return modifiedString
    }

    @objc func myMethodToHandleTap(_ sender: UITapGestureRecognizer) {

        let myTextView = sender.view as! UITextView
        let layoutManager = myTextView.layoutManager

        // location of tap in myTextView coordinates and taking the inset into account
        var location = sender.location(in: myTextView)
        location.x -= myTextView.textContainerInset.left;
        location.y -= myTextView.textContainerInset.top;

        // character index at tap location
        let characterIndex = layoutManager.characterIndex(for: location, in: myTextView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        // if index is valid then do something.
        if characterIndex < myTextView.textStorage.length {

            // print the character index
            print("character index: \(characterIndex)")
            let indexTappedWord = getPalabra(indiceTap: characterIndex)
            

            // print the character at the index
            let myRange = NSRange(location: characterIndex, length: 1)
            let substring = (myTextView.attributedText.string as NSString).substring(with: myRange)
            print("character at index: \(substring)")

            if indicesCorrectos.contains(indexTappedWord){
                let alert = UIAlertController(title: "Alert", message: "Correcto", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                //self.present(alert, animated: true, completion: nil)
                print("CORRECTO")
                //textView.attributedText = correctString
                let auxRange = NSRange(location: indexTappedWord, length: 1)
                let firstChar = (myTextView.attributedText.string as NSString).substring(with: auxRange)
                let characterUpper = Character(String(firstChar).uppercased())
                let newText = myReplace(myString: textView.attributedText.string, indexTappedWord, characterUpper)
                let myNewAttributedText = NSMutableAttributedString(string: newText)
                textView.attributedText = myNewAttributedText
                textView.font = UIFont(name: textView.font!.fontName, size: 25)
                respuestasCorrectasActual = respuestasCorrectasActual + 1
                refreshCounter()
                completedExercise()
            }
            // check if the tap location has a certain attribute
            let attributeName = NSAttributedString.Key.myAttributeName
            let attributeValue = myTextView.attributedText?.attribute(attributeName, at: characterIndex, effectiveRange: nil)
            /*if let value = attributeValue {
                print("You tapped on \(attributeName.rawValue) and the value is: \(value)")
            }*/

        }
    }
    

    //Modo Portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool {
        return false
    }
    
    let defaults = UserDefaults.standard
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let puntajeView = segue.destination as! PuntajeViewController
        defaults.setValue(defaults.integer(forKey: "puntos") + 100, forKey: "puntos")
        puntajeView.correcto = true

    }
}
