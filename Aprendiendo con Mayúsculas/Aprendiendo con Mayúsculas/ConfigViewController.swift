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
    @IBOutlet weak var slFontSize: UISlider!
    var arrNoti = ["en el centro de escritura te pueden asesorar con tus trabajos literarios", "Los nombres propios empiezan con mayúsculas"]
    var defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Ajustes"
        slFontSize.value = defaults.float(forKey: "fontSize")
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func handleNotificationTogle(_ sender: UISwitch) {
        if btnTogleNot.isOn{
            LocalNotificationManager.setNotification(60, of: .seconds, repeats: true, title: "Sabías qué...", body: arrNoti[1], userInfo: ["aps" : ["hello" : "world"]])
        }else{
            LocalNotificationManager.cancel()
        }
        
    }
    


    @IBAction func onChangeSize(_ sender: UISlider) {
        let UILabelAppeareance = UILabel.appearance()
            UILabelAppeareance.font = UIFont(name: "systemFont", size: 30)
    }
    @IBAction func onChangeFont(_ sender: UISlider) {
        let UILabelAppeareance = UILabel.appearance()
        UILabelAppeareance.font = UIFont(name: "systemFont", size: CGFloat(sender.value))
        defaults.set(sender.value, forKey: "fontSize")
    }
    
    
    @IBAction func onChangeBlue(_ sender: UIButton) {
        defaults.set("blue", forKey: "color")
        UINavigationBar.appearance().backgroundColor = UIColor.blue
    }
    @IBAction func onChangePurple(_ sender: UIButton) {
        defaults.set("purple", forKey: "color")
        UINavigationBar.appearance().backgroundColor = UIColor.purple
    }
    
    @IBAction func onChangeGreen(_ sender: UIButton) {
        defaults.set("black", forKey: "color")
        UINavigationBar.appearance().backgroundColor = UIColor.black
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
