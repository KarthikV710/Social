//
//  FeedViewControlelr.swift
//  Social
//
//  Created by Karthik Varma on 6/13/17.
//  Copyright © 2017 Karthik. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedViewControlelr: UIViewController {
    
    @IBOutlet weak var signOutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: kUidKey)
        print("Karthik: user removed form keychain :\(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToLogin", sender: nil)
        
    }

    
}
