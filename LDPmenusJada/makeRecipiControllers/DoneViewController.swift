//
//  DoneViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 10/04/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics
import FirebaseStorage

class DoneViewController: UIViewController {

    @IBOutlet weak var doYouWantToAddLabel: UILabel!
    var nosaukums: String!
    var userData = [lietotajaDati]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Screenshot 2022-04-08 at 14.40.04.imageset")!)
        
        doYouWantToAddLabel.text = "Now it's ready. Do You want to add \(nosaukums ?? "this")'s recipe to Your favourite recipes's list?"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func noBtnTapped(_ sender: Any) {
        let homeWind = self.storyboard?.instantiateViewController(identifier: "homeVC") as? HomeViewController
        self.view.window?.rootViewController = homeWind
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func yesBtnTapped(_ sender: Any) {
        //VĒL PIEVIENOT FAVOURITE LISTEI!!!
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        print(uidSimLietotajam)
        let nosauk = nosaukums!
        var boooo: Bool = true
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
                
                var mas: [String] = []
                //var tekstins: String = ""
                if lEmail == uidSimLietotajam {
                    if boooo == true {
                        boooo = false
                    
                        //jāpievieno tik, ja nav jau pievienots produkts!!!
                    mas = lRecipes
                    mas.append(nosauk)
                
                    print(nosauk)
                    db.collection("users").document(lEmail).updateData(["favouriterecipes": mas])
                    //self.saveData()
                    }
                }
                
                                
                //print(self.enti.count)
                return lietotajaDati(uid: lUi, email: lEmail, password: lPass, name: lName, surname: lSurname, myRecipes: lRecipes)
            }
         

        }
        
        
        
        let homeWind = self.storyboard?.instantiateViewController(identifier: "homeVC") as? HomeViewController
        self.view.window?.rootViewController = homeWind
        self.view.window?.makeKeyAndVisible()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
