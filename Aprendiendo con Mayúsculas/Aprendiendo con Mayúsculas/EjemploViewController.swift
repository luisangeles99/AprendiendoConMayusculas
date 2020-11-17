//
//  EjemploViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 12/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit
class customCell : UITableViewCell{
    @IBOutlet weak var myBtn: UIButton!
    @IBOutlet weak var myLb: UILabel!
}

class EjemploViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tituloLabel: UILabel!
    var tema : String!
    var myPList : NSDictionary!
    @IBOutlet weak var tableView: UITableView!
    var arrEjemplos : NSArray!
    var categoria: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Ejemplos"
      
        let path = Bundle.main.path(forResource:"TemasPList", ofType: "plist")
        myPList = NSDictionary(contentsOfFile: path!)
        let cat = myPList[categoria!] as! NSDictionary
        //print(tema)
        let norma = cat[tema!] as! NSDictionary
        arrEjemplos = norma["Ejemplos"] as? NSArray
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnInfo(_ sender: UIButton) {
        //let indice =  tableView.indexPathForSelectedRow!
        let unEjemplo = arrEjemplos[sender.tag] as! NSDictionary
        let alert = UIAlertController(title: "Justificación", message: (unEjemplo["Justificación"] as! String), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrEjemplos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 151.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda") as! customCell
        let unEjemplo = arrEjemplos[indexPath.row] as! NSDictionary
        celda.myLb.text = unEjemplo["Ejemplo"] as? String
        celda.myLb.font = celda.myLb.font.withSize(22)
        celda.myBtn.tag = indexPath.row
        return celda
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
