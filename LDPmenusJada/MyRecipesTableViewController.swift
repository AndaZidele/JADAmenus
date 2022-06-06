//
//  MyRecipesTableViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 25/02/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import CoreData

class MyRecipesTableViewController: UITableViewController {

    
    @IBOutlet weak var toHomePageTapped: UITabBarItem!
    
    var entikat = [Kateg]()
    var entikla = [Klasite]()
    var enti = [UserEnt]()//te userEntity Tiek Piedefineta
    var managedObjectContext: NSManagedObjectContext?
    var bou: Bool = true
    var tikmer: Int = -1
    
    var foodData = [edienuDati]()
    var lietEp: String = ""
    var userData = [lietotajaDati]()
   // var pievienot: [String] = []
    var piev: [String] = []
    var sk: Int = 0
    
    var kategorija: [String] = []
    var klasite: [String] = []
    var nosaukums: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managedObjectContext = appDelegate.persistentContainer.viewContext
        deleteAllData()
        deleteAllData1()
        deleteAllData2()
        //kategorija.removeAll()
        //klasite.removeAll()
        nosaukums.removeAll()
        kategorija.removeAll()
        klasite.removeAll()
        
        
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        print(uidSimLietotajam)
        

        /*
        db.collection("users").addSnapshotListener{(querySn, err) in
            guard let documents = querySn?.documents else {
                print("Nav šādu dokumentu!")
                return
            }
            self.userData = documents.map{(queryDocSn) -> lietotajaDati in
                let snap = queryDocSn.data()
                let lUi = snap["uid"] as? String ?? ""
                let lEmail = snap["uid"] as? String ?? ""
                let lPass = snap[""] as? String ?? ""
                let lName = snap[""] as? String ?? ""
                let lSurname = snap[""] as? String ?? ""
                let lRecipes = snap[""] as? [String] ?? [""]
                /*let edUi = snap["uid"] as? String ?? ""
                let edLietEpasts = snap["edLietEpasts"] as? String ?? ""
                let edKlas = snap["edKlase"] as? String ?? ""
                let edNos = snap["edNosaukums"] as? String ?? ""
                let edpagatIlg = snap["pagatavošanasIlgums"] as? String ?? ""
                let sarezgit = snap["sarežģītība"] as? String ?? ""
                let masIngred = snap["sastāvdaļas"] as? String ?? ""
                let masStepi = snap["soļi"] as? String ?? ""*/
                if lEmail == uidSimLietotajam {
                    self.lietEp = lEmail
                }
                
                
                
                return lietotajaDati(uid: lUi, email: lEmail, password: lPass, name: lName, surname: lSurname, myRecipes: lRecipes)
            }
            
        }*/
        //print(self.lietEp)
        
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
                
                if uidSimLietotajam == lietE {
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    self.managedObjectContext = appDelegate.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "UserEnt", in: self.managedObjectContext!)
                    let valu = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
                    
                    let ekat = NSEntityDescription.entity(forEntityName: "Kateg", in: self.managedObjectContext!)
                    let ekla = NSEntityDescription.entity(forEntityName: "Klasite", in: self.managedObjectContext!)
                    let valukat = NSManagedObject(entity: ekat!, insertInto: self.managedObjectContext)
                    let valukla = NSManagedObject(entity: ekla!, insertInto: self.managedObjectContext)
                    //for i in 0..<self.pievienot.count {
                    if nos != "" {
                            valu.setValue(nos, forKey: "nosa")
                        valukat.setValue("First Courses", forKey: "nosa")
                        valukla.setValue(kl, forKey: "nosa")
                            self.saveData()
                        self.saveData1()
                        self.saveData2()
                            print("Te seivojam: \(nos)")
                            //self.pievienot[i] = ""
                            //self.loadData()
                            
                    }
                }
                
                return edienuDati(lietotEpasts: lietE, klasite: kl, nosaukums: nos, pagatIlgums: pagatLaik, sarezgit: sarezg, masSast: sast, masStep: soli)
            }
            
        }
        
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
                
                if uidSimLietotajam == lietE {
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    self.managedObjectContext = appDelegate.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "UserEnt", in: self.managedObjectContext!)
                    let valu = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
                    
                    let ekat = NSEntityDescription.entity(forEntityName: "Kateg", in: self.managedObjectContext!)
                    let ekla = NSEntityDescription.entity(forEntityName: "Klasite", in: self.managedObjectContext!)
                    let valukat = NSManagedObject(entity: ekat!, insertInto: self.managedObjectContext)
                    let valukla = NSManagedObject(entity: ekla!, insertInto: self.managedObjectContext)
                    //for i in 0..<self.pievienot.count {
                    if nos != "" {
                            valu.setValue(nos, forKey: "nosa")
                        valukat.setValue("Second Courses", forKey: "nosa")
                        valukla.setValue(kl, forKey: "nosa")
                            self.saveData()
                        self.saveData1()
                        self.saveData2()
                            print("Te seivojam: \(nos)")
                            //self.pievienot[i] = ""
                            //self.loadData()
                            
                    }
                }
                
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
                
                if uidSimLietotajam == lietE {
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    self.managedObjectContext = appDelegate.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "UserEnt", in: self.managedObjectContext!)
                    let valu = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
                    
                    let ekat = NSEntityDescription.entity(forEntityName: "Kateg", in: self.managedObjectContext!)
                    let ekla = NSEntityDescription.entity(forEntityName: "Klasite", in: self.managedObjectContext!)
                    let valukat = NSManagedObject(entity: ekat!, insertInto: self.managedObjectContext)
                    let valukla = NSManagedObject(entity: ekla!, insertInto: self.managedObjectContext)
                    //for i in 0..<self.pievienot.count {
                    if nos != "" {
                            valu.setValue(nos, forKey: "nosa")
                        valukat.setValue("Desserts", forKey: "nosa")
                        valukla.setValue(kl, forKey: "nosa")
                            self.saveData()
                        self.saveData1()
                        self.saveData2()
                            print("Te seivojam: \(nos)")
                            //self.pievienot[i] = ""
                            //self.loadData()
                            
                    }
                }
                
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
                
                if uidSimLietotajam == lietE {
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    self.managedObjectContext = appDelegate.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "UserEnt", in: self.managedObjectContext!)
                    let valu = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
                    
                    let ekat = NSEntityDescription.entity(forEntityName: "Kateg", in: self.managedObjectContext!)
                    let ekla = NSEntityDescription.entity(forEntityName: "Klasite", in: self.managedObjectContext!)
                    let valukat = NSManagedObject(entity: ekat!, insertInto: self.managedObjectContext)
                    let valukla = NSManagedObject(entity: ekla!, insertInto: self.managedObjectContext)
                    //for i in 0..<self.pievienot.count {
                    if nos != "" {
                            valu.setValue(nos, forKey: "nosa")
                        valukat.setValue("Drinks", forKey: "nosa")
                        valukla.setValue(kl, forKey: "nosa")
                            self.saveData()
                        self.saveData1()
                        self.saveData2()
                            print("Te seivojam: \(nos)")
                            //self.pievienot[i] = ""
                            //self.loadData()
                            
                    }
                }
                
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
                
                if uidSimLietotajam == lietE {
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    self.managedObjectContext = appDelegate.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "UserEnt", in: self.managedObjectContext!)
                    let valu = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
                    
                    let ekat = NSEntityDescription.entity(forEntityName: "Kateg", in: self.managedObjectContext!)
                    let ekla = NSEntityDescription.entity(forEntityName: "Klasite", in: self.managedObjectContext!)
                    let valukat = NSManagedObject(entity: ekat!, insertInto: self.managedObjectContext)
                    let valukla = NSManagedObject(entity: ekla!, insertInto: self.managedObjectContext)
                    //for i in 0..<self.pievienot.count {
                    if nos != "" {
                            valu.setValue(nos, forKey: "nosa")
                        valukat.setValue("Snacks", forKey: "nosa")
                        valukla.setValue(kl, forKey: "nosa")
                            self.saveData()
                        self.saveData1()
                        self.saveData2()
                            print("Te seivojam: \(nos)")
                            //self.pievienot[i] = ""
                            //self.loadData()
                            
                    }
                }
                
                return edienuDati(lietotEpasts: lietE, klasite: kl, nosaukums: nos, pagatIlgums: pagatLaik, sarezgit: sarezg, masSast: sast, masStep: soli)
            }
            
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
    func deleteAllData2() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Klasite") //= UserEntity.fetchRequest()
        let delete: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try managedObjectContext?.execute(delete)
            saveData2()
        }catch let err{
            print(err.localizedDescription)
        }
    }
    func deleteAllData1() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Kateg") //= UserEntity.fetchRequest()
        let delete: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try managedObjectContext?.execute(delete)
            saveData1()
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
    func saveData1(){
        do{
            try managedObjectContext?.save()
        }catch{
            fatalError("err in saving core data")
        }
        loadData1()
    }
    func saveData2(){
        do{
            try managedObjectContext?.save()
        }catch{
            fatalError("err in saving core data")
        }
        loadData2()
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
    func loadData1(){
        let request: NSFetchRequest<Kateg> = Kateg.fetchRequest()
        do{
            let result = try managedObjectContext?.fetch(request)
            entikat = result!
            print("Te ladejam")
            tableView.reloadData()
        }catch{
            fatalError("err in loading cora data")
        }
    }
    func loadData2(){
        let request: NSFetchRequest<Klasite> = Klasite.fetchRequest()
        do{
            let result = try managedObjectContext?.fetch(request)
            entikla = result!
            print("Te ladejam")
            tableView.reloadData()
        }catch{
            fatalError("err in loading cora data")
        }
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enti.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myRecCell", for: indexPath) as? MyRecipesTableViewCell else {return UITableViewCell()}

        let entit = enti[indexPath.row]
        cell.myRecLab?.text = "\(entit.value(forKey: "nosa") ?? "Nav")"
        cell.myRecImg.image = UIImage(named: "Screenshot 2022-04-09 at 06.32.30.imageset")
        if (entit.value(forKey: "nosa") as? String) != "" {
            nosaukums.append(entit.value(forKey: "nosa") as! String)
        }
        
        let entitkla = entikla[indexPath.row]
        if (entitkla.value(forKey: "nosa") as? String) != "" {
            klasite.append(entitkla.value(forKey: "nosa") as! String)
        }
        let entitkat = entikat[indexPath.row]
        if (entitkat.value(forKey: "nosa") as? String) != "" {
            kategorija.append(entitkat.value(forKey: "nosa") as! String)
        }
        // Configure the cell...
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
            let myRecVC = segue.destination as! OneRecipeViewController
            myRecVC.kategorija = kategorija[indexPath.row]
            myRecVC.klasite = klasite[indexPath.row]
            myRecVC.nosaukums = nosaukums[indexPath.row]
        }
    }
    

}
