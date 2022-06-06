//
//  SignUpViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 25/02/2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordAgain: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Screenshot 2022-04-08 at 14.40.04.imageset")!)

        // Do any additional setup after loading the view.
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let err = isFieldsValid()
        if err != nil {
            //Show the Error!!!
        } else {
            let fName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let passw = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //let passwAgain = passwordAgain.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: passw) { (result, err) in
                if err != nil {
                    //Show error creating user!!!
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").document(email).setData(["uid": result!.user.uid, "vards": fName, "uzvards": lName, "emails": email, "password": passw, "favouriterecipes": ""]) { (err) in
                        if err != nil {
                            //Show error saving user data
                        } else {
                            let homeWind = self.storyboard?.instantiateViewController(identifier: "homeVC") as? HomeViewController
                            self.view.window?.rootViewController = homeWind
                            self.view.window?.makeKeyAndVisible()
                        }
                    }
                }
                
            }
        }
    }
    
    func isPasswValid(_ password : String) -> Bool{
        let passwordValid = NSPredicate(format: "Self Matches %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        
        return passwordValid.evaluate(with: password)
    }
    
    //funkcija parbauda, vai visi teksta lauki aizpilditi
    func isFieldsValid() -> String? {
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordAgain.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields!"
        }
        
        let cleanedPassw = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedPasswAgain = passwordAgain.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if cleanedPassw != cleanedPasswAgain {
            return "Please make sure if Your password has been written correctly second time."
        
        } else {
            if isPasswValid(cleanedPassw) == false && isPasswValid(cleanedPasswAgain) == false {
                return "Please make sure Your password is at least 8 characters, contains a special character and a number."
            }
        }
        
        return nil
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
