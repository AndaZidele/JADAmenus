//
//  AddIngrTableViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 04/03/2022.
//

import UIKit

class AddIngrTableViewController: UITableViewController {

    var skaits = 0
    private var tvContr: UITableView?
    var mas: [String] = []
    var masi: [String] = []
    @IBOutlet weak var ingredientaNosaukums: UITextField!
    
    var selectedCategory: String!
    var selectedKlase: String!
    var nosaukums: String!
    var pagatLaiks: String!
    var sarezgit: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //skaits = 0
        tableView.dataSource = self
        tableView.delegate = self
        
        /*if nosaukums != nil {
            print(nosaukums!)
        }*/
        
    }
    @IBAction func addIngrTapped(_ sender: Any) {
        if ingredientaNosaukums.text != nil {
            skaits = skaits + 1
            //mas.insert(ingredientaNosaukums.text!, at: 0)
            //mas = masi
            
            mas.append(ingredientaNosaukums.text!)
            masi = mas
            var skRindai: Int = 0
            for _ in 0..<masi.count {
                skRindai = skRindai + 1
            }
            skRindai = skRindai - 1
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: skRindai, section: 0)], with: .right)
            tableView.endUpdates()
            ingredientaNosaukums.text = ""
            //tableView.reloadData()
        //tvContr?.reloadData()
        }
    }
    @IBAction func saveIngrAndNext(_ sender: Any) {
        
        print(mas)
        
        
    }
    
    
    //ir delete funkcija tik nepareizi nosaukta!!!
    @IBAction func addIngredients(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        mas.remove(at: indexpath.row)
        skaits = skaits - 1
        
        
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
        tableView.endUpdates()
        
        
        
    }
    
    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //mas.removeAll()
        return skaits
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "addIngredients", for: indexPath) as? AddIngrTableViewCell else {return UITableViewCell()}

        //cell.ingredientName.placeholder = "ingredient"
        // Configure the cell...

        /*if cell.ingredientName.text != "" {
            mas.append(cell.ingredientName.text!)
        }*/
        for i in 0..<self.masi.count {
            if self.masi[i] != "" {
                cell.ingredNamelab.text = masi[i]
                masi[i] = ""
            }
        }
        
        
        return cell
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
        let stepsVC = segue.destination as! AddStepsTableViewController
        stepsVC.nosaukums = nosaukums
        stepsVC.selectKlase = selectedKlase
        stepsVC.selectCategory = selectedCategory
        stepsVC.sarezgit = sarezgit
        stepsVC.pagatLaiks = pagatLaiks
        stepsVC.mas = mas

    }
    

}
