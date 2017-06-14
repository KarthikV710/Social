//
//  ViewController.swift
//  Social
//
//  Created by Karthik Varma on 6/11/17.
//  Copyright © 2017 Karthik. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func facebookBtnTapped(_ sender: RoundButton) {
        
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Karthik: Failed to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("Karthik: User cancelled FB Auth")
            } else {
                print("Karthik: Facebook Auth successfull")
                let credential:FIRAuthCredential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                
            }
        }
    }
    
    func firebaseAuth(_ credential:FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Karthik: Unable to authenticate with Firebase: \(String(describing: error))")
            } else {
                print("Karhtik: Firebase auth sucessful")
            }
        })
        
    }
}

