//
//  CategoryTableViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 03/03/2022.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var category = Category.createCategories()
    var selectedCategory: Int = -1
    var kategorijasNosaukums: String = ""
    var nosaukums: String = ""
    var bildite: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return category.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as? CategoryTableViewCell else {return UITableViewCell()}

        // Configure the cell...
        let categoryCell = category[indexPath.row]
        cell.categorylabel.text = categoryCell.name
        cell.categoryImg.image = UIImage(named: categoryCell.image)
        //nosaukums = categoryCell.name

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
            
            
            //tālākais view controllers
            let klaseTVC = segue.destination as! KlaseTableViewController
            //
            nosaukums = category[indexPath.row].name
            bildite = category[indexPath.row].image
            
            //turpinajumā nonjemtais nav pārbaudīts!
            /*
            if nosaukums == "First Courses" {
                selectedCategory = 0
               // klaseTVC.klase =
                klaseTVC.selectedCategory = 0
            }
            else if nosaukums == "Second Courses" {
                selectedCategory = 1
                klaseTVC.selectedCategory = 1
            } else if nosaukums == "Desserts" {
                klaseTVC.selectedCategory = 2
            } else if nosaukums == "Drinks" {
                klaseTVC.selectedCategory = 3
            } else {
                klaseTVC.selectedCategory = 4
            }*/
            klaseTVC.kategorijasNosaukums = nosaukums
            klaseTVC.bildite = bildite
            
            
        }
        
        
        
    }
    

}
