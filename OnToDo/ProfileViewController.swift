//
//  ProfileViewController.swift
//  OnToDo
//
//  Created by Lava kumar  on 24/02/22.
//  Copyright © 2022 user206151. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    var ref:DatabaseReference!
    
  
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var save: UIButton!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        ref = Database.database().reference().child("users")
    
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButton(_ sender: Any) {
    
        addUsers()
        
    }
   
    func addUsers() {
        let key = ref.childByAutoId().key
        
        let user = ["id": key, "userName": name.text! as String, "userPhone": phone.text! as String, "userEmail": email.text! as String]
        
    }

}
