//
//  NormaImageViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 05/11/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class NormaImageViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var imagen: UIImageView!
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagen.image = image
        
        scroll.minimumZoomScale = 1.0
        scroll.maximumZoomScale = 5.0
        
        // Do any additional setup after loading the view.
    }
    

    func viewForZooming(in scroll: UIScrollView) -> UIView? {
        return self.imagen
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
