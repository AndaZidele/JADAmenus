//
//  SomeRecipesTableViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 02/03/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics
import FirebaseStorage
//import WebKit
import CoreData

class SomeRecipesTableViewController: UITableViewController {

    @IBOutlet weak var klasiteLab: UILabel!
    
    var enti = [UserEnt]()//te userEntity Tiek Piedefineta
    var managedObjectContext: NSManagedObjectContext?
    
    var bildite: String!
    var kategorija: String!
    var klasite: String!
    var nosaukums: [String] = [""]
    //var nosaukums2: [String]
    var foodData = [edienuDati]()
    
    var edienuNos: [String] = []
    var edieni: [String] = []
    var sk = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managedObjectContext = appDelegate.persistentContainer.viewContext
        deleteAllData()
        //print(kategorija!)
        //print(klasite!)
        klasiteLab.text = klasite!
        nosaukums.removeAll()
        
        if kategorija != nil {
        var edi: [String] = []
        var ska = 0
        let db = Firestore.firestore()
        var boo: Bool = true

        db.collection(kategorija!).addSnapshotListener{(querySn, err) in
            guard let documents = querySn?.documents else {
                print("Nav šādu dokumentu!")
                return
            }
            boo = false
            var ed: [String] = []
            self.foodData = documents.map{(queryDocSn) -> edienuDati in
                let snap = queryDocSn.data()
                let kl = snap["klase"] as? String ?? ""
                let lietEp = snap["lietotajaEpasts"] as? String ?? ""
                let nos = snap["nosaukums"] as? String ?? ""
                let pagatLaik = snap["pagatIlg"] as? String ?? ""
                let sarezg = snap["sarezgitiba"] as? String ?? ""
                let sast = snap["sastavdalas"] as? [String] ?? [""]
                let soli = snap["soli"] as? [String] ?? [""]
                //self.edienuNos.append(nos)
                var pievienot: [String] = []
                if kl == self.klasite {
                    /*if boo == true {
                    boo = false
                    pievienot.append(nos)
                    //self.edienuNos.append(nos)
                    self.sk = self.sk + 1
                    }*/
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    self.managedObjectContext = appDelegate.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "UserEnt", in: self.managedObjectContext!)
                    let valu = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
                    //for i in 0..<self.pievienot.count {
                    if nos != "" {
                            valu.setValue(nos, forKey: "nosa")
                            self.saveData()
                            print("Te seivojam: \(nos)")
                            //self.pievienot[i] = ""
                            //self.loadData()
                            
                    }
                    //print(self.edienuNos)
                }
                
                self.edieni = self.edieni + pievienot
                pievienot.removeAll()
                boo = true
                return edienuDati(lietotEpasts: lietEp, klasite: kl, nosaukums: nos, pagatIlgums: pagatLaik, sarezgit: sarezg, masSast: sast, masStep: soli)
            }
            //self.edieni = ed
            //print(self.edieni)
            print(self.sk)
            for i in 0..<self.edieni.count {
                self.edienuNos.append(self.edieni[i])
            }
            ska = self.sk
            //print(ska)
            ed = self.edieni
            //print(ed)
            edi = ed
            //print(edi)
            boo = false
            print(boo)
            if boo == false {
                //print(edi)
                self.edieni = edi
                self.sk = self.edieni.count
                self.edienuNos = self.edieni
                //print(self.edienuNos)
            }
        }
        
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
            tableView.reloadData()
        }catch{
            fatalError("err in loading cora data")
        }
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

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return enti.count//self.sk
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "somerecipe", for: indexPath) as? SomeRecipesTableViewCell else {return UITableViewCell()}

        /*for i in 0..<self.edienuNos.count {
            if self.edienuNos[i] != "" {
                cell.edienaNosaukumins.text = self.edienuNos[i]
                self.edienuNos[i] = ""
                //print(self.edieni)
            }
        }*/
        let entit = enti[indexPath.row]
        cell.edienaNosaukumins?.text = entit.value(forKey: "nosa") as? String
        if (entit.value(forKey: "nosa") as? String) != "" {
            nosaukums.append(entit.value(forKey: "nosa") as! String)
        }
        cell.bilditeImg.image = UIImage(named: bildite)
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
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
        if let indexPath = tableView.indexPathForSelectedRow {
            let myRecVC = segue.destination as! OneRecipeViewController
            myRecVC.kategorija = kategorija
            myRecVC.klasite = klasite
            myRecVC.nosaukums = nosaukums[indexPath.row]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
