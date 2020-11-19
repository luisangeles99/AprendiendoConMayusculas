//
//  RecursosViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 13/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class RecursosViewController: UIViewController {

    //user defaults
    let defaults = UserDefaults.standard
    
    //Outlets for color
    @IBOutlet weak var recursos: UILabel!
    @IBOutlet weak var referencias: UILabel!
    @IBOutlet weak var programadores: UILabel!
    @IBOutlet weak var creditos: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Recursos"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var color : UIColor!
        if (defaults.string(forKey: "color") == "purple"){
            color = .systemIndigo
        } else if (defaults.string(forKey: "color") == "black") {
            color = .label
        } else {
            color = .link
        }
        recursos.backgroundColor = color.withAlphaComponent(0.7)
        referencias.backgroundColor = color.withAlphaComponent(0.7)
        programadores.backgroundColor = color.withAlphaComponent(0.7)
        creditos.backgroundColor = color.withAlphaComponent(0.7)
    }
    
    @IBAction func clickLink1(_ sender: UIButton) {
        if let url = URL(string: "https://sites.google.com/itesm.mx/cescrituratec/inicio") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func clickLink2(_ sender: UIButton) {
        if let url = URL(string: "https://www.rae.es/dpd/may%2525C3%2525BAsculas") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func clickLink3(_ sender: UIButton) {
        if let url = URL(string: "http://www.wikilengua.org/index.php/May%C3%BAsculas_y_min%C3%BAsculas") {
            UIApplication.shared.open(url)
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
    
    //Modo Portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool {
        return false
    }

}
