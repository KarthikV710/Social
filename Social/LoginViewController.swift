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
import SwiftKeychainWrapper

class LoginViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fbLoginButton: RoundButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if KeychainWrapper.standard.string(forKey: kUidKey) != nil {
            print("Karthik: Existing user found")
            self.performSegue(withIdentifier: "goToFeed", sender: nil)
        }
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
                self.completeSignIn(user: user)
            }
        })
        
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Karthik: Email auth successful")
                    self.completeSignIn(user: user)
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("Karthik: Unable to authenticate with firebase using email: \(String(describing: error))")
                        } else {
                            print("Karthik: Create user successful with email")
                            self.completeSignIn(user: user)
                        }
                    })
                }
            })
            
        }
    }
    
    func completeSignIn(user: FIRUser?) {
        if let user = user {
            let keychainResult = KeychainWrapper.standard.set(user.uid , forKey: kUidKey)
            print("Karthik: UID saved to keychain: \(keychainResult)")
            self.performSegue(withIdentifier: "goToFeed", sender: nil)

        }
    }
    
}

