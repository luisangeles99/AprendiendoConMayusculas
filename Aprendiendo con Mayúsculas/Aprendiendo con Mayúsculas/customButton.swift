//
//  customButton.swift
//  Aprendiendo con Mayúsculas
//
//  Created by user180585 on 10/18/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    let defaults = UserDefaults.standard
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    func setupButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        if titleLabel?.text == "Avanzado"{
            backgroundColor = UIColor.red.withAlphaComponent(0.5)
        }else if titleLabel?.text == "Básico"{
            backgroundColor = #colorLiteral(red: 0.6073725514, green: 0.9137254902, blue: 0.904033244, alpha: 0.6390196918)
        }else if defaults.string(forKey: "color") == "purple"{
            backgroundColor = #colorLiteral(red: 0.7564462184, green: 0.5984446765, blue: 0.9686274529, alpha: 1)
        }else if defaults.string(forKey: "color") == "black"{
            backgroundColor = .lightGray
        }
        else{
           backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }

        //titleLabel?.font     = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius   = 25
        layer.borderWidth    = 3.0
        layer.borderColor    = UIColor.darkGray.cgColor
    }
    
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    
}
