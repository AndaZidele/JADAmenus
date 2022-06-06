//
//  AddRecipeViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 03/03/2022.
//

import UIKit

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var nosaukums: UITextField!
    @IBOutlet weak var pagatavosana: UITextField!
    @IBOutlet weak var sarezgitiba: UITextField!
    
    
    //var selectedCategory: Int!
    //var selectedKlase: Int!
    var nosaukumsKategorijai: String! //pievienojamais kategorijas nosaukums db
    var nosaukumsKlasei: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Screenshot 2022-04-08 at 14.40.04.imageset")!)
        
        print(nosaukumsKlasei!)
        print(nosaukumsKategorijai!)
        // Do any additional setup after loading the view.
        //pārbaudei:
        
    }
    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let nosauk: String = nosaukums.text {
            if let pagatav: String = pagatavosana.text{
                if let sarezgit: String = sarezgitiba.text {
                    let ingredientsVC = segue.destination as! AddIngrTableViewController
                    ingredientsVC.nosaukums = nosauk
                    ingredientsVC.selectedKlase = nosaukumsKlasei
                    ingredientsVC.selectedCategory = nosaukumsKategorijai
                    ingredientsVC.pagatLaiks = pagatav
                    ingredientsVC.sarezgit = sarezgit
            //ingredientsVC.selectedKlase = selectedKlase
            //ingredientsVC.selectedCategory = selectedCategory
                }
            }
        }
        
    }
    

}


//saglabat
/*
 let db = Firestore.firestore()
 db.collection("users").addDocument(data: ["fName": fName, "lName": lName, "email": email, "passeord": passw, "uid": result!.user.uid]) { (err) in
     if err != nil {
         //Show error saving user data
     }
 }
 */


//iegut datus
/*
 let db = Firestore.firestore()
 let doc = db.collection("composition").document("elytaan").documentID
 
 
 db.collection("composition").addSnapshotListener { (querySnapshot, error) in
     guard let documents = querySnapshot?.documents
     else {
         print("Nav sadu compositionu!")
         return
     }
     self.comp = documents.map {(queryDocumentSnapshot) -> sastavdalas in
         let nos = queryDocumentSnapshot.data()
         let sast = nos["Calcium"] as? String ?? ""
         
         if sast != "" {
             print(db.collection("composition").document().documentID)
         }
         return sastavdalas(nosauk: sast)
     }
 }
 
 
 
 db.collection("composition").getDocuments() { (querySnapshot, err) in
     if let err = err {
         print("Error getting documents: \(err)")
     } else {
         for document in querySnapshot!.documents {
             print("\(document.documentID) => \(document.data())")
             
         }
         
     }
 }
 */
