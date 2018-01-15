//
//  SignUpViewController.swift
//  Firebase Turtuorial
//
//  Created by Admin on 1/11/18.
//  Copyright © 2018 eman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fb: UIButton!
    @IBOutlet weak var txtEmail: UITextField!

    @IBOutlet weak var txtPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        fb.layer.cornerRadius = 5
        fb.layer.borderWidth = 0.2
        fb.layer.borderColor = UIColor.white.cgColor
        
        // 1
        Auth.auth().addStateDidChangeListener() { auth, user in
            // 2
            if user != nil {
                // 3
                //                self.performSegue(withIdentifier: self.loginToList, sender: nil)
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                self.present(newViewController, animated: true, completion: nil)            }
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        if txtEmail.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
    }
        else{
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
                
            if error == nil {
                    print("you have successfully signed up")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
                    self.present(vc!, animated: true, completion: nil)
                }
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
        }


    
    }


    @IBAction func fbLogin(_ sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                
                // Present the main view
                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") {
                    UIApplication.shared.keyWindow?.rootViewController = viewController
                    self.dismiss(animated: true, completion: nil)
                }
                
            })
            
        }   
    }
}
