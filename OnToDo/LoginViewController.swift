//
//  LoginViewController.swift
//  OnToDo
//
//  Created by user215559 on 2/22/22.
//  Copyright © 2022 user206151. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController{

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
            checkUserInfo()  // check if already a user is logged in
        }
        

    @IBAction func signInBtn(_ sender: Any) {
        validateFields()
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    func validateFields() {
            if textFieldEmail.text?.isEmpty == true {
                print("Please enter your email")
                return
            }
            
            if textFieldPassword.text?.isEmpty == true {
                print("Please enter your password")
                return
            }
            
            login()
        }
        
        func login() {
            Auth.auth().signIn(withEmail: textFieldEmail.text!, password: textFieldPassword.text!) { [weak self] authResult, err in
                guard let strongSelf = self else {return}
                if let err = err {
                    print(err.localizedDescription)
                }
                self.checkUserInfo()
            }
        
        }
        
        func checkUserInfo() {
            if Auth.auth().currentUser != nil {
                print(Auth.auth().currentUser?.uid)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Home")
                vc.modalPresentationStyle = .overFullScreen
                present(vc, animated: true)        }
        }
        }
