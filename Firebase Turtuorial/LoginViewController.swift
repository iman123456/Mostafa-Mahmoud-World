//
//  LoginViewController.swift
//  Firebase Turtuorial
//
//  Created by Admin on 1/11/18.
//  Copyright © 2018 eman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    

   
    @IBAction func btnLogin(_ sender: UIButton) {
        if self.txtPassword.text == "" || self.txtEmail.text == "" {
            
            let alert = UIAlertController(title: "error", message: "please fill email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
        else{
            Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user,error) in
                if(error == nil){
                print("you have successfully logged in")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
                self.present(vc!, animated: true, completion: nil)
                }
                else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            
            }
            
        }
        
    }

}
