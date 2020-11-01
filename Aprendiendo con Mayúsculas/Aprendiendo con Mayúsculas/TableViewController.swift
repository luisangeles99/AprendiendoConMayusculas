//
//  TableViewController.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 12/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell{
    //celda customized
    @IBOutlet weak var imgTema: UIImageView!
    @IBOutlet weak var nombreTema: UILabel!
    @IBOutlet weak var insignia: UIImageView!
}

class TableViewController: UITableViewController {

    
    
    @IBOutlet weak var navBarAppearence: UINavigationItem!
    
    var infoPlist : NSDictionary!
    var numOfRows = [13,3]
    var headerTitles : [String]!
    var temasTitles : [[String]?] = [[],[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        obtenerInfo()
        title = "Inicio"
        
        headerTitles = infoPlist.allKeys as? [String]
        let mayusTitles = infoPlist["Mayúsculas"] as! NSDictionary
        
        let minusTitles = infoPlist["Minúsculas"] as! NSDictionary
        temasTitles[0] = mayusTitles.allKeys as? [String]
        temasTitles[1] = minusTitles.allKeys as? [String]
        
        //Ordenar el array por orden alfabético
        temasTitles[0] = temasTitles[0]!.sorted(by: { s1, s2 in return s1 < s2 })
        temasTitles[1] = temasTitles[1]!.sorted(by: { s1, s2 in return s1 < s2 })
        
        
      
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return headerTitles.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numOfRows[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! customTableViewCell

        cell.nombreTema.text = temasTitles[indexPath.section]![indexPath.row]
        cell.imgTema.image = UIImage(named: "Aa")
        cell.insignia.image = UIImage(named: "medalla")

        return cell
    }
    
    //Height of row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126.0
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    //MARK: - Obtener Temas del plist
    @IBAction func obtenerInfo(){
        let path = Bundle.main.path(forResource:"TemasPList", ofType: "plist")
        infoPlist = NSDictionary(contentsOfFile: path!)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        let indice = tableView.indexPathForSelectedRow!
        destination.minmay = headerTitles[indice.section]
        destination.tema = temasTitles[indice.section]![indice.row]
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
