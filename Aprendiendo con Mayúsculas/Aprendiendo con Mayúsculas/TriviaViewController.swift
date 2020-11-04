//
//  TriviaViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 03/11/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func girarRuleta(_ sender: Any) {
        let number = Int.random(in: 0..<10)
        UIView.animate(withDuration: 3, delay: 0, options: [UIView.AnimationOptions.curveEaseOut], animations: {
            for _ in 0..<100 {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 1))
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(number
                ))
            }
            
        })
        
    }
}
