//
//  FavouritesTableViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 09/04/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics
import FirebaseStorage
import CoreData
import WebKit

class FavouritesTableViewController: UITableViewController {


    var foodData = [edienuDati]()
    var userData = [lietotajaDati]()
    var enti = [UserEnt]()//te userEntity Tiek Piedefineta
    var managedObjectContext: NSManagedObjectContext?
    var ska: Int = 0
    var b = -1
    
    var ma1: [String] = []
    var ma2: [String] = []
    
    var sunuSkaits: Int! //= 0
    var sunuSaturs: [String]! //[String] = []
    var sunuKat: [String] = []
    var sunuKla: [String] = []
    var sunuNosa: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managedObjectContext = appDelegate.persistentContainer.viewContext
        deleteAllData()
        
        /*
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        print(uidSimLietotajam)
        //var boo: Bool = true
        
        
        db.collection("users").addSnapshotListener{(querySn, err) in
            guard let documents = querySn?.documents else {
                print("Nav šādu dokumentu!")
                return
            }
            self.userData = documents.map{(queryDocSn) -> lietotajaDati in
                let snap = queryDocSn.data()
                let lUi = snap["uid"] as? String ?? ""
                let lEmail = snap["emails"] as? String ?? ""
                let lPass = snap["password"] as? String ?? ""
                let lName = snap["vards"] as? String ?? ""
                let lSurname = snap["uzvards"] as? String ?? ""
                let lRecipes = snap["favouriterecipes"] as? [String] ?? [""]
                
                var tekstins: String = ""
                if lEmail == uidSimLietotajam {
      /*              //entitijam pievienot lRecipes
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    self.managedObjectContext = appDelegate.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "UserEnt", in: self.managedObjectContext!)
                    let valu = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
                    var mas: [String] = [] //= lRecipes[i]
                    for i in 0..<lRecipes.count {
                        mas.append(lRecipes[i])
                       
                        //TE SAGLABĀT MASĪVU!!!
                        
                    }
                    
                    //print()
                    //valu.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
                    //valu.setValuesForKeys(<#T##keyedValues: [String : Any]##[String : Any]#>)
                    print("Masīvs mas:  \(mas)")
                    self.ska = mas.count
                    for i in 0..<mas.count {
                        if tekstins != "" {
                            tekstins = tekstins + "||" + mas[i]
                        } else {
                            tekstins = mas[i]
                        }
                    }
                    print(tekstins)
                    //valu.setValue(tekstins, forKey: "nosa")
                    
                    let array = tekstins.components(separatedBy: "||")
                    print(array)
                    valu.setValuesForKeys(["masiv" : array])
                    self.saveData()
*/
                    //self.saveData()
                    
                    
                    var masivins: [String] = []
                    for i in 0..<lRecipes.count {
                        masivins.append(lRecipes[i])
                    }
                    //
                   
                    self.sunuSaturs = masivins
                    self.sunuSkaits = masivins.count
                    print(self.sunuSaturs)
                    print(self.sunuSkaits)
                }
                
                                
                //print(self.enti.count)
                return lietotajaDati(uid: lUi, email: lEmail, password: lPass, name: lName, surname: lSurname, myRecipes: lRecipes)
            }
         

        }
        
       */
        let db = Firestore.firestore()

        for i in 0..<sunuSaturs.count {
            if sunuSaturs[i] != "" {
                let nosa = sunuSaturs[i]
                
                db.collection("Second Courses").addSnapshotListener{(querySn, err) in
                    guard let documents = querySn?.documents else {
                        print("Nav šādu dokumentu!")
                        return
                    }
                    //boo = false
                    //var ed: [String] = []
                    self.foodData = documents.map {(queryDocSn) -> edienuDati in
                        let snap = queryDocSn.data()
                        let kl = snap["klase"] as? String ?? ""
                        let lietE = snap["lietotajaEpasts"] as? String ?? ""
                        let nos = snap["nosaukums"] as? String ?? ""
                        let pagatLaik = snap["pagatIlg"] as? String ?? ""
                        let sarezg = snap["sarezgitiba"] as? String ?? ""
                        let sast = snap["sastavdalas"] as? [String] ?? [""]
                        let soli = snap["soli"] as? [String] ?? [""]
                        
                        //for i in 0..<nos.count {
                        if nosa == nos {
                            self.sunuKat.append("Second Courses")
                            self.sunuKla.append(kl)

                            self.sunuNosa.append(nos)
                            
                        }
                        //}
                                               
                        return edienuDati(lietotEpasts: lietE, klasite: kl, nosaukums: nos, pagatIlgums: pagatLaik, sarezgit: sarezg, masSast: sast, masStep: soli)
                    }
                    
                }
                
                db.collection("Snacks").addSnapshotListener{(querySn, err) in
                    guard let documents = querySn?.documents else {
                        print("Nav šādu dokumentu!")
                        return
                    }
                    //boo = false
                    //var ed: [String] = []
                    self.foodData = documents.map {(queryDocSn) -> edienuDati in
                        let snap = queryDocSn.data()
                        let kl = snap["klase"] as? String ?? ""
                        let lietE = snap["lietotajaEpasts"] as? String ?? ""
                        let nos = snap["nosaukums"] as? String ?? ""
                        let pagatLaik = snap["pagatIlg"] as? String ?? ""
                        let sarezg = snap["sarezgitiba"] as? String ?? ""
                        let sast = snap["sastavdalas"] as? [String] ?? [""]
                        let soli = snap["soli"] as? [String] ?? [""]
                        
                        //for i in 0..<nos.count {
                        if nosa == nos {
                            self.sunuKat.append("Snacks")
                            self.sunuKla.append(kl)

                            self.sunuNosa.append(nos)
                            
                        }
                        //}
                                               
                        return edienuDati(lietotEpasts: lietE, klasite: kl, nosaukums: nos, pagatIlgums: pagatLaik, sarezgit: sarezg, masSast: sast, masStep: soli)
                    }
                    
                }

                
                db.collection("Drinks").addSnapshotListener{(querySn, err) in
                    guard let documents = querySn?.documents else {
                        print("Nav šādu dokumentu!")
                        return
                    }
                    //boo = false
                    //var ed: [String] = []
                    self.foodData = documents.map {(queryDocSn) -> edienuDati in
                        let snap = queryDocSn.data()
                        let kl = snap["klase"] as? String ?? ""
                        let lietE = snap["lietotajaEpasts"] as? String ?? ""
                        let nos = snap["nosaukums"] as? String ?? ""
                        let pagatLaik = snap["pagatIlg"] as? String ?? ""
                        let sarezg = snap["sarezgitiba"] as? String ?? ""
                        let sast = snap["sastavdalas"] as? [String] ?? [""]
                        let soli = snap["soli"] as? [String] ?? [""]
                        
                        //for i in 0..<nos.count {
                        if nosa == nos {
                            self.sunuKat.append("Drinks")
                            self.sunuKla.append(kl)

                            self.sunuNosa.append(nos)
                            
                        }
                        //}
                                               
                        return edienuDati(lietotEpasts: lietE, klasite: kl, nosaukums: nos, pagatIlgums: pagatLaik, sarezgit: sarezg, masSast: sast, masStep: soli)
                    }
                    
                }

                
                db.collection("Desserts").addSnapshotListener{(querySn, err) in
                    guard let documents = querySn?.documents else {
                        print("Nav šādu dokumentu!")
                        return
                    }
                    //boo = false
                    //var ed: [String] = []
                    self.foodData = documents.map {(queryDocSn) -> edienuDati in
                        let snap = queryDocSn.data()
                        let kl = snap["klase"] as? String ?? ""
                        let lietE = snap["lietotajaEpasts"] as? String ?? ""
                        let nos = snap["nosaukums"] as? String ?? ""
                        let pagatLaik = snap["pagatIlg"] as? String ?? ""
                        let sarezg = snap["sarezgitiba"] as? String ?? ""
                        let sast = snap["sastavdalas"] as? [String] ?? [""]
                        let soli = snap["soli"] as? [String] ?? [""]
                        
                        //for i in 0..<nos.count {
                        if nosa == nos {
                            self.sunuKat.append("Desserts")
                            self.sunuKla.append(kl)

                            self.sunuNosa.append(nos)
                            
                        }
                        //}
                                               
                        return edienuDati(lietotEpasts: lietE, klasite: kl, nosaukums: nos, pagatIlgums: pagatLaik, sarezgit: sarezg, masSast: sast, masStep: soli)
                    }
                    
                }

                
                db.collection("First Courses").addSnapshotListener{(querySn, err) in
                    guard let documents = querySn?.documents else {
                        print("Nav šādu dokumentu!")
                        return
                    }
                    //boo = false
                    //var ed: [String] = []
                    self.foodData = documents.map {(queryDocSn) -> edienuDati in
                        let snap = queryDocSn.data()
                        let kl = snap["klase"] as? String ?? ""
                        let lietE = snap["lietotajaEpasts"] as? String ?? ""
                        let nos = snap["nosaukums"] as? String ?? ""
                        let pagatLaik = snap["pagatIlg"] as? String ?? ""
                        let sarezg = snap["sarezgitiba"] as? String ?? ""
                        let sast = snap["sastavdalas"] as? [String] ?? [""]
                        let soli = snap["soli"] as? [String] ?? [""]
                        
                        //for i in 0..<nos.count {
                        if nosa == nos {
                            self.sunuKat.append("First Courses")
                            self.sunuKla.append(kl)

                            self.sunuNosa.append(nos)
                            
                        }
                        //}
                                               
                        return edienuDati(lietotEpasts: lietE, klasite: kl, nosaukums: nos, pagatIlgums: pagatLaik, sarezgit: sarezg, masSast: sast, masStep: soli)
                    }
                    
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
            print(enti.count)
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
        return self.sunuSkaits
        //enti.count//self.ska//enti.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favour", for: indexPath) as? FavouritesTableViewCell else {return UITableViewCell()}

        // Configure the cell...
        print("Esam pie šūnām!!!")
       // let entit = enti[indexPath.row]
       // let abc = entit.value(forKey: "masiv") // ?? "Nav"
      //  print("Te printējam masīvu: \(abc)")
        /*var array = abc.components(separatedBy: ",")
        for i in 0..<array.count {
            if array[i] != "" {
                cell.favlab?.text = array[i]
                array[i] = ""
                return cell
            }
        }*/
        //var be = entit.value(forKey: "masiv")
        
        for i in 0..<self.sunuSaturs.count {
            if self.sunuSaturs[i] != "" {
                cell.favlab.text = self.sunuSaturs[i]
                self.sunuSaturs[i] = ""
                cell.favimg.image = UIImage(named: "Screenshot 2022-04-09 at 06.32.30.imageset")
                return cell
            }
        }
        //cell.favlab?.text = "\(entit.value(forKey: "masiv") ?? "Nav")"
        //cell.favimg.image = UIImage(named: "Screenshot 2022-04-09 at 06.32.30.imageset")
        /*
        let teksts = entit.value(forKey: "nosa") as! String
        let array = teksts.components(separatedBy: "||")
        for i in 0..<array.count {
            cell.favlab?.text = array[i]// ?? "Nav"
            print(array[i])
            return cell
        }
        */
        

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
        let oneRecVC = segue.destination as! OneRecipeViewController
            oneRecVC.nosaukums = self.sunuNosa[indexPath.row]//
            oneRecVC.kategorija = self.sunuKat[indexPath.row]//"kategorija"
            oneRecVC.klasite = self.sunuKla[indexPath.row]//"klasite"
    }
    }
    

}
