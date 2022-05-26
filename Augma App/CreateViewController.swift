//
//  ViewController.swift
//  Augma App
//
//  Created by Tushar Nandwani on 9/28/19.
//  Copyright © 2019 Augma. All rights reserved.
//

import UIKit
import Firebase

class CreateViewController: UIViewController {
    
    @IBOutlet weak var emailInput: UITextField!
    
    @IBOutlet weak var passInput: UITextField!
    
    @IBOutlet weak var passConfirmInput: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBAction func createButton(_ sender: Any) {
        
        
        
        print("email is " + emailInput.text!)
        
        // email contains @
        
        if ((emailInput.text!.contains("@"))){
            print("email contains @")
            //  pass not empty
            if (passInput.text! != ""){
                print("pass not empty")
                // same password
                if (passInput.text! == passConfirmInput.text!){
                    print("same password")
                    Auth.auth().createUser(withEmail: emailInput.text!, password: passInput.text!) { authResult, error in
                        // [START_EXCLUDE]
                        
                        guard let user = authResult?.user, error == nil else {
                            
                            print(error!)
                            
                            self.errorMessage.text = (error!.localizedDescription)
                            return
                        }
                        print("\(user.email!) created")
                        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                        guard let HomeVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as? UIViewController else {
                            print("messed up segue")
                        }
                        
                        self.navigationController?.pushViewController(HomeVC, animated: true)
                        
                        
                        // [END_EXCLUDE]
                    }
                }
                
            }
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Login with Firebase
        let user = Auth.auth().currentUser
        if let user = user {
            
            let username = user.displayName!
            print(username)
            
            
            
        }
        
        
        
    }
    
}
