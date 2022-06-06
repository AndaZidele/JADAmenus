//
//  AddStepsTableViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 04/03/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics
import FirebaseStorage
import WebKit //nav ne jausmas kā šī te uzradās

class AddStepsTableViewController: UITableViewController {

    //var lietEp: String = ""
    var selectCategory: String!
    var selectKlase: String!
    var nosaukums: String!
    var pagatLaiks: String!
    var sarezgit: String!
    var mas: [String]! //ingedientu saraksts
    var masivsi: [String] = []
    var masivs: [String] = [] //steps saraksts
    var m: String = ""
    var pedejais: String = ""
    
    var skaits = 0
    var foodData = [edienuDati]()
    var userData = [lietotajaDati]()
    
    @IBOutlet weak var stepName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addStepBtn(_ sender: Any) {
        if stepName.text != "" {
            skaits = skaits + 1
            
            masivs.append(stepName.text!)
            masivsi = masivs
            var skRindai: Int = 0
            for _ in 0..<masivsi.count {
                skRindai = skRindai + 1
            }
            skRindai = skRindai - 1
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: skRindai, section: 0)], with: .right)
            tableView.endUpdates()
            stepName.text = ""
        //tableView.reloadData()
        }
    }
    
    @IBAction func deleteStepBtn(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        masivs.remove(at: indexpath.row)
        skaits = skaits - 1
        
        
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
        tableView.endUpdates()
    }
    
    
    //TE KĀ SAGLABĀT DATU BĀZĒ RECEPTI!!!
    @IBAction func saveStepsAndNext(_ sender: Any) {
        print(masivs)
            
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        print(uidSimLietotajam)
        //var boo: Bool = true
        
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
        
        //boo = false
        
        db.collection(self.selectCategory).document(self.nosaukums).setData(["klase": self.selectKlase!, "lietotajaEpasts": uidSimLietotajam, "nosaukums": self.nosaukums!, "pagatIlg": self.pagatLaiks!, "sarezgitiba": self.sarezgit!, "sastavdalas": self.mas!, "soli": self.masivs])
        
        
        let myVC = "myprofile"
        let myWindow = storyboard?.instantiateViewController(withIdentifier: myVC) as? MyProfileViewController
        self.view.window?.rootViewController = myWindow
        self.view.window?.makeKeyAndVisible()
        
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //masivs.removeAll()
        return skaits
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "addSteps", for: indexPath) as? AddStepsTableViewCell else {return UITableViewCell()}
        
        for i in 0..<self.masivsi.count {
            if self.masivsi[i] != "" {
                cell.stepLabel.text = masivsi[i]
                masivsi[i] = ""
            }
        }
        //masivs.append()
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
    }
    

}
