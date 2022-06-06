//
//  KlaseTableViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 03/03/2022.
//

import UIKit

class KlaseTableViewController: UITableViewController {

    var klase = Class.createClasses()
    var kategorijasNos: Int = -1 //sis tik parbaudei
    var selectedKlase: Int = -1
    var selectedCategory: Int!
    var kategorijasNosaukums: String!
    var bildite: String!
    var fDishes = firstDishes.createFirst()
    var sDishes = secondDishes.createSecond()
    var desserti = desserts.createDesserts()
    var snaki = snacks.createSnacks()
    var drinki = drinks.createDrinks()
    
    @IBOutlet weak var nosaukumsKlasei: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return klase.count
        
        if kategorijasNosaukums == "First Courses" {
            return fDishes.count
        }
        if kategorijasNosaukums == "Second Courses" {
            return sDishes.count
        }
        if kategorijasNosaukums == "Desserts" {
            return desserti.count
        }
        if kategorijasNosaukums == "Drinks" {
            return drinki.count
        }
        if kategorijasNosaukums == "Snacks" {
            return snaki.count
        }
        
        return snaki.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "klase", for: indexPath) as? ClassTableViewCell else {return UITableViewCell()}
        
        if kategorijasNosaukums == "First Courses" {
            cell.klaseLabel.text = fDishes[indexPath.row].name
        }
        if kategorijasNosaukums == "Second Courses" {
            cell.klaseLabel.text = sDishes[indexPath.row].name
        }
        if kategorijasNosaukums == "Desserts" {
            cell.klaseLabel.text = desserti[indexPath.row].name
        }
        if kategorijasNosaukums == "Drinks" {
            cell.klaseLabel.text = drinki[indexPath.row].name
        }
        if kategorijasNosaukums == "Snacks" {
            cell.klaseLabel.text = snaki[indexPath.row].name
            
        }

        // Configure the cell...
        //let klasesCell = klase[indexPath.row]
        //cell.klaseLabel.text = klasesCell.name

        cell.bilditelab.image = UIImage(named: bildite)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow {
            //
            let recepteVC = segue.destination as! AddRecipeViewController
            
            
            //let klasesName = klase[indexPath.row].name
            /*if klasesName == "Latvian Cuisine" {
                selectedKlase = 0
                recepteVC.selectedKlase = selectedKlase
            } else {
                recepteVC.selectedKlase = selectedKlase
            }*/
            
            
            var klasitesNos: String = ""
            if kategorijasNosaukums == "First Courses" {
                klasitesNos = fDishes[indexPath.row].name
            }
            if kategorijasNosaukums == "Second Courses" {
                klasitesNos = sDishes[indexPath.row].name
            }
            if kategorijasNosaukums == "Desserts" {
                klasitesNos = desserti[indexPath.row].name
            }
            if kategorijasNosaukums == "Drinks" {
                klasitesNos = drinki[indexPath.row].name
            }
            if kategorijasNosaukums == "Snacks" {
                klasitesNos = snaki[indexPath.row].name
            }
            
            
            recepteVC.nosaukumsKlasei = klasitesNos
            recepteVC.nosaukumsKategorijai = kategorijasNosaukums
            //recepteVC.selectedCategory = selectedCategory
        }
     
    }

}
