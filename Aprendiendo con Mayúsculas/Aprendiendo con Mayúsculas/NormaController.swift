//
//  NormaController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 12/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class NormaController: UIViewController {
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var explicacion: UILabel!
    var myPList : NSDictionary!
    var tema : String!
    var seccion : Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource:"TemasPList", ofType: "plist")
        myPList = NSDictionary(contentsOfFile: path!)
        var cat = myPList["Mayúsculas"] as! NSDictionary
        var norma = cat[tema] as! NSDictionary
        norma = norma["Teoría"] as! NSDictionary
        explicacion.text = norma["Explicación"] as! String
        myTitle.text = tema
        // Do any additional setup after loading the view.
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
