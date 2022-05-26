//
//  ViewController.swift
//  Augma App
//
//  Created by Tushar Nandwani on 9/28/19.
//  Copyright © 2019 Augma. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailInput: UITextField!
    
    @IBOutlet weak var passInput: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        
        let email = emailInput.text!
        let password = passInput.text!
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            // [START_EXCLUDE]
            if let error = error {
                self?.errorMessage.text = (error.localizedDescription)
                return
            }
            print("user logged in")
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let HomeVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as? UIViewController else {
                print("messed up segue")
            }
            
            self?.navigationController?.pushViewController(HomeVC, animated: true)
            
            
            // [END_EXCLUDE]
        }
        
    }
    override func viewDidLoad() {
        
        
        
    }
    
}
