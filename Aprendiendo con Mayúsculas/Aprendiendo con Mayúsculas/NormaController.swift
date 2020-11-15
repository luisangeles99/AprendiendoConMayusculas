//
//  NormaController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 12/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class NormaController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewInterna: UIView!
    @IBOutlet weak var media1img: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var explicacion: UILabel!
    var myPList : NSDictionary!
    var tema : String!
    var seccion : Int!
    var categoria: String!
    var tappedimage : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = viewInterna.frame.size
        
        title = tema
        let path = Bundle.main.path(forResource:"TemasPList", ofType: "plist")
        myPList = NSDictionary(contentsOfFile: path!)
        let cat = myPList[categoria!] as! NSDictionary
        var norma = cat[tema!] as! NSDictionary
        norma = norma["Teoría"] as! NSDictionary
        explicacion.text = norma["Explicación"] as? String
        myTitle.text = tema
        media1img.image = UIImage(named: "infografia_ej")
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        media1img.isUserInteractionEnabled = true
        media1img.addGestureRecognizer(tapGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        tappedimage = tappedImage.image
        
        self.performSegue(withIdentifier: "imagen", sender: nil)
        
        // Your action
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let view = segue.destination as! NormaImageViewController
        view.image = tappedimage
        
    }
    

}
