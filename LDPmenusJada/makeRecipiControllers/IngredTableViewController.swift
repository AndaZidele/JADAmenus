//
//  IngredTableViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 10/04/2022.
//

import UIKit

class IngredTableViewController: UITableViewController {

    var ingredLi: [String]!
    var stepLi: [String]!
    var nosaukumins: String!
    
    var buttonList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(ingredLi!)
        print(stepLi!)
        
        for _ in 0..<ingredLi.count {
            buttonList.append("checkmark.shield")
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ingredLi.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ingred", for: indexPath) as? IngredTableViewCell else {return UITableViewCell()}
        
        cell.ingNameLabel.text = ingredLi[indexPath.row]
        //cell.ingDoneBtn.setImage(UIImage(systemName: "checkmark.shield"), for: .normal)
        cell.ingDoneBtn.setImage(UIImage(systemName: buttonList[indexPath.row]), for: .normal)

        return cell
    }
    
    @IBAction func isBoughtTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        //tableView.cellForRow(at: indexpath).setImage("checkmark.shield.fill")
        if buttonList[indexpath.row] == "checkmark.shield.fill" {
            buttonList.remove(at: indexpath.row)
            buttonList.insert("checkmark.shield", at: indexpath.row)
        } else {
        
        buttonList.remove(at: indexpath.row)
        buttonList.insert("checkmark.shield.fill", at: indexpath.row)
        //let sk = indexpath.row - 1
        }
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .right)
        tableView.insertRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
        //tableView.cellForRow(at: point)?.ingDoneBtn?.setImage("checkmark.shield.fill", for: point)
        tableView.endUpdates()
        
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
        let stepListVC = segue.destination as! StepListTableViewController
        stepListVC.stepL = stepLi
        stepListVC.nosaukumins = nosaukumins
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
