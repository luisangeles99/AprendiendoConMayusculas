//
//  ConfigViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 13/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    @IBOutlet weak var btnTogleNot: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Ajustes"
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleNotificationTogle(_ sender: UISwitch) {
        if btnTogleNot.isOn{
            LocalNotificationManager.setNotification(5, of: .seconds, repeats: true, title: "Hello", body: "local", userInfo: ["aps" : ["hello" : "world"]])
        }else{
            LocalNotificationManager.cancel()
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
