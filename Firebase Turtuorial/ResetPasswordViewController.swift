//
//  ResetPasswordViewController.swift
//  Firebase Turtuorial
//
//  Created by Admin on 1/11/18.
//  Copyright © 2018 eman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class ResetPasswordViewController: UIViewController {

    var titl = ""
    var msg = ""
    
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPassword(_ sender: UIButton) {
        if txtEmail.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().sendPasswordReset(withEmail: txtEmail.text!, completion: { (error) in
                if (error != nil) {
                    self.titl = "Sorry"
                    self.msg = (error?.localizedDescription)!
                }
                else{
                    self.titl = "Success"
                    self.msg = "Password was sent"
                    self.txtEmail.text = ""
                    
                }
                let alertController = UIAlertController(title: self.titl, message: self.msg, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }

}
