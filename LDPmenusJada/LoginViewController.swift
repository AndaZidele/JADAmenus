//
//  LoginViewController.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 25/02/2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class LoginViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Screenshot 2022-04-08 at 14.40.04.imageset")!)

        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if err != nil {
                //kļūda
            } else {
                let homeWind = self.storyboard?.instantiateViewController(identifier: "homeVC") as? HomeViewController
                self.view.window?.rootViewController = homeWind
                self.view.window?.makeKeyAndVisible()
            }
        }
        
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
