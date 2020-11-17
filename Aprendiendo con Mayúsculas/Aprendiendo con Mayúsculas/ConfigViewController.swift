//
//  ConfigViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 13/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    
    @IBOutlet weak var navi: UINavigationItem!
    let bar = UINavigationBarAppearance()
    @IBOutlet weak var slFontSize: UISlider!
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Ajustes"
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    
    
    
    @IBAction func onChangeBlue(_ sender: UIButton) {
        defaults.set("blue", forKey: "color")
        UINavigationBar.appearance().backgroundColor = UIColor.link
        UINavigationBar.appearance().tintColor = UIColor.link
        navigationController!.navigationBar.backgroundColor = .link
        
    }
    
    
    @IBAction func onChangePurple(_ sender: UIButton) {
        defaults.set("purple", forKey: "color")
        UINavigationBar.appearance().backgroundColor = UIColor.systemIndigo
        UINavigationBar.appearance().tintColor = UIColor.systemIndigo
        navigationController!.navigationBar.backgroundColor = .systemIndigo
    }
    
    @IBAction func onChangeGreen(_ sender: UIButton) {
        defaults.set("black", forKey: "color")
        UINavigationBar.appearance().backgroundColor = UIColor.label
        UINavigationBar.appearance().tintColor = UIColor.label
        navigationController!.navigationBar.backgroundColor = .label
       

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
