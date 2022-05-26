//
//  ViewController.swift
//  Augma App
//
//  Created by Tushar Nandwani on 9/28/19.
//  Copyright © 2019 Augma. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeName: UILabel!
    
    @IBAction func logoutPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            print("Signed Out :)")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let user = Auth.auth().currentUser
        
        if let user = user {
            
            let username = user.displayName
            
            if (username == nil){
                homeName.text = "Welcome Back " + user.email!
                
            }
            else{
                
                homeName.text = "Welcome Back " + username!
                
            }
            
        }
        
        
        
    }
    
}
