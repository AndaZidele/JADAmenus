//
//  OneRecipeViewController.swift
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
import CoreData

class OneRecipeViewController: UIViewController {
    
    @IBOutlet weak var nosaukLabel: UILabel!
    @IBOutlet weak var pagatavLaiksLabel: UILabel!
    @IBOutlet weak var sarezgitibaLabel: UILabel!
    
    @IBOutlet weak var ingredLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    
    
    

    var kategorija: String!
    var klasite: String!
    var nosaukums: String!
    var pagatavosanasIlgums: String = ""
    var sarezgitiba: String = ""
    var foodData = [edienuDati]()
    var userData = [lietotajaDati]()
    
    var ingredList: [String] = []
    var stepList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Screenshot 2022-04-08 at 14.40.04.imageset")!)
        
        print(nosaukums!)
        print(kategorija!)
        print(klasite!)

        // Do any additional setup after loading the view.
        
        if kategorija != nil {
            let db = Firestore.firestore()
        
        db.collection(kategorija!).addSnapshotListener{(querySn, err) in
            guard let documents = querySn?.documents else {
                print("Nav šādu dokumentu!")
                return
            }
            //boo = false
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
                //var pievienot: [String] = []
                if nos == self.nosaukums && kl == self.klasite {
                    print("Tagad te būs šīs receptes dati:")
                    print(nos)
                    self.nosaukLabel.text = nos.uppercased()
                    self.pagatavLaiksLabel.text = "Preparation Time: \(pagatLaik) minutes!"
                    self.sarezgitibaLabel.text = "Dificultiy: \(sarezg)!"
                    
                    for i in 0..<soli.count {
                        if self.stepsLabel.text != "" {
                        self.stepsLabel.text = self.stepsLabel.text! + (String(i+1)) + ". \(soli[i]) \n"
                            self.stepList.append(soli[i])
                        }
                        else {
                            self.stepsLabel.text = (String(i+1)) + ". \(soli[i]) \n"
                            self.stepList.append(soli[i])
                        }
                    }
                    
                    for i in 0..<sast.count {
                        if self.ingredLabel.text != "" {
                        self.ingredLabel.text = self.ingredLabel.text! + (String(i+1)) + ". \(sast[i]) \n"
                            self.ingredList.append(sast[i])
                        }
                        else {
                            self.ingredLabel.text = (String(i+1)) + ". \(sast[i]) \n"
                            self.ingredList.append(sast[i])
                        }
                    }
                    
                }
                
                //boo = true
                return edienuDati(lietotEpasts: lietEp, klasite: kl, nosaukums: nos, pagatIlgums: pagatLaik, sarezgit: sarezg, masSast: sast, masStep: soli)
            }
           
            }
        
        }
        
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ingredListVC = segue.destination as! IngredTableViewController
        ingredListVC.ingredLi = ingredList
        ingredListVC.stepLi = stepList
        ingredListVC.nosaukumins = nosaukums
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
