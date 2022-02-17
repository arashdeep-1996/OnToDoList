//
//  ViewController.swift
//  OnToDo
//
//  Created by user206151 on 2/14/22.
//  Copyright © 2022 user206151. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sidebar: UITableView!
    var sideBarOpen: Bool = false
    var arrdata = ["Home","Task Group","Team Members","Profile","Logout"]
     override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
        sidebar.delegate = self
        sidebar.dataSource = self
           sideView.isHidden = true
           sidebar.backgroundColor = UIColor.groupTableViewBackground
           sideBarOpen = false
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lbl.text = arrdata[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0//home
        {
            let Main: MenuController = self.storyboard?.instantiateViewController(identifier: "main") as! MenuController
            self.navigationController?.pushViewController(Main, animated: true)
        }
    }

    @IBAction func Menubtn(_ sender: Any) {
        sidebar.isHidden = false
        sideView.isHidden = false
        self.view.bringSubviewToFront(sideView)
        if !sideBarOpen{
            sideBarOpen = true
            sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
            sidebar.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
            sidebar.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
            UIView.commitAnimations()
        }
        else{
            sidebar.isHidden = true
            sideView.isHidden = true
            sideBarOpen = false
            sideView.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
            sidebar.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
            sidebar.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
            
        }
    }
    
}
class MenuController: UIViewController {

    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var DeleteTaskButton: UIButton!
    @IBOutlet weak var ProfileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addTaskButton.layer.cornerRadius = 22
        DeleteTaskButton.layer.cornerRadius = 22
        ProfileImage.layer.cornerRadius = 40
        
    }


}

