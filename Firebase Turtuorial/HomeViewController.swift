//
//  HomeViewController.swift
//  Firebase Turtuorial
//
//  Created by Admin on 1/11/18.
//  Copyright © 2018 eman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class HomeViewController: UIViewController {

    @IBOutlet weak var webVIew: UIWebView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        btn1.backgroundColor = .clear
        btn1.layer.cornerRadius = 5
        btn1.layer.borderWidth = 0.2
        btn1.layer.borderColor = UIColor.white.cgColor

        btn2.backgroundColor = .clear
        btn2.layer.cornerRadius = 5
        btn2.layer.borderWidth = 0.2
        btn2.layer.borderColor = UIColor.white.cgColor
        
        btn3.backgroundColor = .clear
        btn3.layer.cornerRadius = 5
        btn3.layer.borderWidth = 0.2
        btn3.layer.borderColor = UIColor.white.cgColor
        
        btn4.backgroundColor = .clear
        btn4.layer.cornerRadius = 5
        btn4.layer.borderWidth = 0.2
        btn4.layer.borderColor = UIColor.white.cgColor
        
        btn5.backgroundColor = .clear
        btn5.layer.cornerRadius = 5
        btn5.layer.borderWidth = 0.2
        btn5.layer.borderColor = UIColor.white.cgColor
        
        btn6.backgroundColor = .clear
        btn6.layer.cornerRadius = 5
        btn6.layer.borderWidth = 0.2
        btn6.layer.borderColor = UIColor.white.cgColor
        
        btn7.backgroundColor = .clear
        btn7.layer.cornerRadius = 5
        btn7.layer.borderWidth = 0.2
        btn7.layer.borderColor = UIColor.white.cgColor
        
        btn8.backgroundColor = .clear
        btn8.layer.cornerRadius = 5
        btn8.layer.borderWidth = 0.2
        btn8.layer.borderColor = UIColor.white.cgColor
        
        btn9.backgroundColor = .clear
        btn9.layer.cornerRadius = 5
        btn9.layer.borderWidth = 0.2
        btn9.layer.borderColor = UIColor.white.cgColor
        
        btn10.backgroundColor = .clear
        btn10.layer.cornerRadius = 5
        btn10.layer.borderWidth = 0.2
        btn10.layer.borderColor = UIColor.white.cgColor

           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       

        
    }
    
    @IBAction func signOut(_ sender: UIBarButtonItem) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
                self.present(vc!, animated: true, completion: nil)
            } catch let error as NSError {
                let alert = UIAlertController(title: "Sorry", message: error.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }
        }

    }
    
    @IBAction func mazaWraaBwabetElmoot(_ sender: UIButton) {
        webVIew.isHidden = false


        if let pdf = Bundle.main.url(forResource: "mazaWraaBwabetElmoot", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
              self.view.addSubview(webVIew)
           
            
            
        }
        
    }
    
    @IBAction func alaatElnar(_ sender: UIButton) {
        webVIew.isHidden = false

        if let pdf = Bundle.main.url(forResource: "alaatElnar", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
            self.view.addSubview(webVIew)
            
        }

    }
   
    @IBAction func anbar7(_ sender: UIButton) {
        webVIew.isHidden = false

        
        if let pdf = Bundle.main.url(forResource: "anbar7", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
            self.view.addSubview(webVIew)
            
        }
    }
    
    @IBAction func mokttfat(_ sender: UIButton) {
        webVIew.isHidden = false
        
        if let pdf = Bundle.main.url(forResource: "mokttfat", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
            self.view.addSubview(webVIew)
            
        }

    }
    
    @IBAction func hewarMaSadeky(_ sender: UIButton) {
        webVIew.isHidden = false

        
        if let pdf = Bundle.main.url(forResource: "hewar", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
            self.view.addSubview(webVIew)
            
        }

    }
    
    @IBAction func menAsrar(_ sender: UIButton) {
        webVIew.isHidden = false
        
        if let pdf = Bundle.main.url(forResource: "menAsrarEL", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
            self.view.addSubview(webVIew)
            
        }

    }
    
    @IBAction func kelmetElser(_ sender: UIButton) {
        webVIew.isHidden = false

        
        if let pdf = Bundle.main.url(forResource: "kelmetElser", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
           
            self.view.addSubview(webVIew)
            
        }

    }
    @IBAction func rewind(_ sender: UIBarButtonItem) {
        webVIew.isHidden = true
    }
    @IBAction func einsh(_ sender: UIButton) {
        webVIew.isHidden = false
        if let pdf = Bundle.main.url(forResource: "einshtien", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
            self.view.addSubview(webVIew)
            
        }

    }
    
    @IBAction func elwgod(_ sender: UIButton) {
        webVIew.isHidden = false
        
        
        if let pdf = Bundle.main.url(forResource: "elwgod", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
            self.view.addSubview(webVIew)
            
        }

    }
    
    @IBAction func elshetan(_ sender: UIButton) {
        webVIew.isHidden = false
        if let pdf = Bundle.main.url(forResource: "elshetan", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webVIew.loadRequest(req as URLRequest)
         
            self.view.addSubview(webVIew)
            
        }
    }
    
}
