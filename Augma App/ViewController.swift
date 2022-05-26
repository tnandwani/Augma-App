//
//  ViewController.swift
//  Augma App
//
//  Created by Tushar Nandwani on 9/28/19.
//  Copyright © 2019 Augma. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, LoginButtonDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var namelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if logged in
        let user = Auth.auth().currentUser
        
        if let user = user {
            let username = user.displayName
            if (username == nil){
                changeName(newUsername: user.uid)

            }
            else{
                changeName(newUsername: username)

            }
        }
        
        
        // Facebook Button Setup
        let fbLoginButton = FBLoginButton();
        fbLoginButton.frame = CGRect(x: 75, y: 550, width: 265, height: 50);
        
        view.addSubview(fbLoginButton)
        fbLoginButton.delegate = self
        
        
        // Google Button Setup
        
        let gLoginButton = GIDSignInButton()
        gLoginButton.frame  = CGRect(x: 75, y: 615, width: 265, height: 50);
        
        view.addSubview(gLoginButton);
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self

        // prepare main page
        
        
    }
    
    func changeName(newUsername: String?){
        
        print("change name")

        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let HomeVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as? UIViewController else {
            print("messed up segue")
        }
        
        self.navigationController?.pushViewController(HomeVC, animated: true)
        
    }
    
    
    
    
    // FB LOGIN BUTTON
    
    func loginButton(_ fbLoginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("3")
        
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current?.tokenString ?? "false");
        
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            // User is signed in
            print("5")
            
            let username = authResult!.user.displayName!
            self.changeName(newUsername: username);
            print(username)
            print(authResult!.user.uid)
            
            
            
            // ...
        }
        
    }
    
    
    // Google sign in delegates
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                print(error)
                return
            }
            // User is signed in
            let username = authResult!.user.displayName!
            self.changeName(newUsername: username);
            print(username)
            print(authResult!.user.uid)

           
            
        }
        // ...
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("did Log out")
    }
    
    
    
    
}

