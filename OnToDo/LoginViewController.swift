//
//  LoginViewController.swift
//  OnToDo
//
//  Created by user215559 on 2/22/22.
//  Copyright © 2022 user206151. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textFieldEmail.resignFirstResponder()
        self.textFieldPassword.resignFirstResponder()
        return true
    }

    @IBAction func signInBtn(_ sender: Any) {
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
    }
    
}
