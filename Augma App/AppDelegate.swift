//
//  AppDelegate.swift
//  Augma App
//
//  Created by Tushar Nandwani on 9/28/19.
//  Copyright © 2019 Augma. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var window: UIWindow?
    
   // MAIN DELEGATE AT STARTUP
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //Fireabse init
        FirebaseApp.configure();
        
        // FB init???
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
 
        // Gooogle Init
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        
        return true
    }
    
  
    
    
    
    // FB sign in delegate
    func application(_ application: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        
        let fbHandle = ApplicationDelegate.shared.application(application, open: url, options: options)
        let gHandle =  GIDSignIn.sharedInstance().handle(url)
        
        if (fbHandle || gHandle){
            return true

        }
        else{
            return false
        }
        

        
    }
    
  
      
    
    // default delegates
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it beg ins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        AppEvents.activateApp()
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

