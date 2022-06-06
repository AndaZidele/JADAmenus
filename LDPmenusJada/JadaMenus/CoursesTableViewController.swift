//
//  CoursesTableViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 02/03/2022.
//

import UIKit
import CoreData

class CoursesTableViewController: UITableViewController {

    var enti = [UserEnt]()//te userEntity Tiek Piedefineta
    var managedObjectContext: NSManagedObjectContext?
    
    var klase = Class.createClasses()
    var fDishes = firstDishes.createFirst()
    var sDishes = secondDishes.createSecond()
    var desserti = desserts.createDesserts()
    var snaki = snacks.createSnacks()
    var drinki = drinks.createDrinks()
    
    var bildite: String!
    var kategorija: String!
    @IBOutlet weak var kategorijasNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kategorijasNameLabel.text = kategorija!
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managedObjectContext = appDelegate.persistentContainer.viewContext
        deleteAllData()
    }
    func deleteAllData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEnt") //= UserEntity.fetchRequest()
        let delete: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try managedObjectContext?.execute(delete)
            saveData()
        }catch let err{
            print(err.localizedDescription)
        }
    }
    func saveData(){
        do{
            try managedObjectContext?.save()
        }catch{
            fatalError("err in saving core data")
        }
        loadData()
    }
    func loadData(){
        let request: NSFetchRequest<UserEnt> = UserEnt.fetchRequest()
        do{
            let result = try managedObjectContext?.fetch(request)
            enti = result!
            print("Te ladejam")
            //tableView.reloadData()
        }catch{
            fatalError("err in loading cora data")
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if kategorija == "First Courses" {
            return fDishes.count
        }
        if kategorija == "Second Courses" {
            return sDishes.count
        }
        if kategorija == "Desserts" {
            return desserti.count
        }
        if kategorija == "Drinks" {
            return drinki.count
        }
        if kategorija == "Snacks" {
            return snaki.count
        }
        return snaki.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "courses", for: indexPath) as? CoursesTableViewCell else {return UITableViewCell()}

        if kategorija == "First Courses" {
            cell.klasNos.text = fDishes[indexPath.row].name
        }
        if kategorija == "Second Courses" {
            cell.klasNos.text = sDishes[indexPath.row].name
        }
        if kategorija == "Desserts" {
            cell.klasNos.text = desserti[indexPath.row].name
        }
        if kategorija == "Drinks" {
            cell.klasNos.text = drinki[indexPath.row].name
        }
        if kategorija == "Snacks" {
            cell.klasNos.text = snaki[indexPath.row].name
        }

        cell.klasImg.image = UIImage(named: bildite)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
        
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
            let sarakstsVC = segue.destination as! SomeRecipesTableViewController
            
            var klasite: String = ""
            if kategorija == "First Courses" {
                klasite = fDishes[indexPath.row].name
            }
            if kategorija == "Second Courses" {
                klasite = sDishes[indexPath.row].name
            }
            if kategorija == "Desserts" {
                klasite = desserti[indexPath.row].name
            }
            if kategorija == "Drinks" {
                klasite = drinki[indexPath.row].name
            }
            if kategorija == "Snacks" {
                klasite = snaki[indexPath.row].name
            }
            
            sarakstsVC.kategorija = kategorija
            sarakstsVC.klasite = klasite
            sarakstsVC.bildite = bildite
            
        }
    }
    

}
