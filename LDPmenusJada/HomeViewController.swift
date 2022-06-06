//
//  HomeViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 25/02/2022.
//

import UIKit
import CoreData
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics
import FirebaseStorage

class HomeViewController: UIViewController {
    var userData = [lietotajaDati]()
    var sunuSkaits = 0
    var sunuSaturs: [String] = []
    
    var entikat = [Kateg]()
    var entikla = [Klasite]()
    var enti = [UserEnt]()//te userEntity Tiek Piedefineta
    var managedObjectContext: NSManagedObjectContext?

    @IBOutlet weak var stackViewHidden: UIStackView!
    @IBOutlet weak var labelHidden: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Screenshot 2022-04-08 at 14.40.04.imageset")!)

        // Do any additional setup after loading the view.
        labelHidden.isHidden = false
        stackViewHidden.isHidden = true
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managedObjectContext = appDelegate.persistentContainer.viewContext
        deleteAllData()
        deleteAllData1()
        deleteAllData2()
        
       // let entity = NSEntityDescription.entity(forEntityName: "UserEnt", in: self.managedObjectContext!)
        //let valu = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
        
        
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
                    self.sunuSkaits = self.sunuSkaits - 1
                    
                }
                
                                
                //print(self.enti.count)
                return lietotajaDati(uid: lUi, email: lEmail, password: lPass, name: lName, surname: lSurname, myRecipes: lRecipes)
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
    func loadData1(){
        let request: NSFetchRequest<Kateg> = Kateg.fetchRequest()
        do{
            let result = try managedObjectContext?.fetch(request)
            entikat = result!
            print("Te ladejam")
            //tableView.reloadData()
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
            //tableView.reloadData()
        }catch{
            fatalError("err in loading cora data")
        }
    }
    
    
    
    
    @IBAction func menuTapped(_ sender: Any) {
        labelHidden.isHidden = true
        stackViewHidden.isHidden = false
    }
    
    @IBAction func toHomePageTapped(_ sender: Any) {
        stackViewHidden.isHidden = true
        labelHidden.isHidden = false
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        let homeWind = self.storyboard?.instantiateViewController(identifier: "login") as? LoginViewController
        self.view.window?.rootViewController = homeWind
        self.view.window?.makeKeyAndVisible()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let favouriVC = segue.destination as? FavouritesTableViewController {
            favouriVC.sunuSkaits = sunuSkaits
            favouriVC.sunuSaturs = sunuSaturs
        //let klaseTVC = segue.destination as! KlaseTableViewController
        }
    }
    

}
