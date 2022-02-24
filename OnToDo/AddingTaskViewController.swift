//
//  AddingTaskViewController.swift
//  OnToDo
//
//  Created by Mac on 23/02/22.
//  Copyright © 2022 user206151. All rights reserved.
//

import UIKit

class AddingTaskViewController: UIViewController {

    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var taskDeadline: UITextField!
    @IBOutlet weak var taskStatus: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveTask(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
