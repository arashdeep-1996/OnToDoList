//
//  signInViewController.swift
//  OnToDo
//
//  Created by user206151 on 2/22/22.
//  Copyright © 2022 user206151. All rights reserved.
//
import UIKit
import FirebaseAuth
class signInViewController: UIViewController {

    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var SignUP: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Email.placeholder = "E-Mail"
        Email.layer.borderWidth = 1
        Email.layer.borderColor = UIColor.black.cgColor
        fName.placeholder = "First Name"
        fName.layer.borderWidth = 1
        fName.layer.borderColor = UIColor.black.cgColor
        lName.placeholder = "Last Name"
        lName.layer.borderWidth = 1
        lName.layer.borderColor = UIColor.black.cgColor
        Password.placeholder = "Password"
        Password.layer.borderWidth = 1
        Password.layer.borderColor = UIColor.black.cgColor
        SignUP.layer.cornerRadius = 30
       
    }

    @IBAction func signUpButton(_ sender: Any) {
        guard let email = Email.text, !email.isEmpty,
            let password = Password.text, !password.isEmpty else{
                print("Missing field data")
                return
        }
        // Create cleaned versions of the data
        let firstName = fName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
    let eMail = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        // Create the user
        Auth.auth().createUser(withEmail: email, password: password) { [self] (result, err) in
            
            // Check for errors
            if err != nil {
                
                // There was an error creating the user
                print("Error creating user")
            }
            else {
                
                // User was created successfully, now store the first name and last name
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["fName":firstName, "Email":eMail, "uid": result!.user.uid ]) { (error) in
                    
                    if error != nil {
                        // Show error message
                        print("Error saving user data")
                    }
                }
        //Get auth instance
        //attempt sign in
        //if failure, present alert to create account
        //if user continues, create account
        
        //check sign in on app launch
        //allow user to sign out with button
    }
    @IBAction func signInButton(_ sender: Any) {
    }
    
}
