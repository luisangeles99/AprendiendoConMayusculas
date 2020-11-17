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
   
    
   
    @IBOutlet weak var btnTogleNot: UISwitch!

    @IBOutlet weak var slFontSize: UISlider!
    static var arrNoti = ["En el centro de escritura te pueden asesorar con tus trabajos literarios", "Los nombres propios empiezan con mayúsculas", "Puedes practica tu uso de mayúsculas con minijuegos", "Las obras literarias solo llevan mayúscula en la primer palabra"]
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Ajustes"
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func handleNotificationTogle(_ sender: UISwitch) {
        if btnTogleNot.isOn{
            defaults.setValue(true, forKey: "notificaciones")
            let rand = Int.random(in: 0...3)
            LocalNotificationManager.setNotification(5, of: .hours, repeats: true, title: "Sabías qué...", body: ConfigViewController.arrNoti[rand], userInfo: ["aps" : ["hello" : "world"]])
        }else{
            LocalNotificationManager.cancel()
            defaults.setValue(false, forKey: "notificaciones")
        }
        
    }
    
    static func externNotification(flag: Bool){
        if flag{
            let rand = Int.random(in: 0...3)
            LocalNotificationManager.setNotification(5, of: .hours, repeats: true, title: "Sabías qué...", body: arrNoti[rand], userInfo: ["aps" : ["hello" : "world"]])
        }
    }
    
    


    
    
    @IBAction func onChangeBlue(_ sender: UIButton) {
        defaults.set("blue", forKey: "color")
        UINavigationBar.appearance().backgroundColor = UIColor.link
        
        navigationController!.navigationBar.backgroundColor = .link
        
    }
    
    
    @IBAction func onChangePurple(_ sender: UIButton) {
        defaults.set("purple", forKey: "color")
        UINavigationBar.appearance().backgroundColor = UIColor.systemIndigo
        
        navigationController!.navigationBar.backgroundColor = .systemIndigo
    }
    
    @IBAction func onChangeGreen(_ sender: UIButton) {
        defaults.set("black", forKey: "color")
        UINavigationBar.appearance().backgroundColor = UIColor.label
        
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
