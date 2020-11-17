//
//  ContactoViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 13/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class ContactoViewController: UIViewController {

    @IBOutlet weak var btContacto1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contacto"
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickContact1(_ sender: UIButton) {
        if let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdg6lvRLUjIKmc_73yfIr0REEs6zzDQGCSS1JSHnzc1wRuwXA/viewform") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func onClickSocialFB(_ sender: UIButton) {
        if let url = URL(string: "https://www.facebook.com/cescrituraTEC/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func onClickSocialTw(_ sender: UIButton) {
        if let url = URL(string: "https://twitter.com/cescrituratec") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func onClickSocialIG(_ sender: UIButton) {
        if let url = URL(string: "https://www.instagram.com/cescrituraTEC/") {
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
