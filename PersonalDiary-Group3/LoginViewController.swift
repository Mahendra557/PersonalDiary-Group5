//
//  LoginViewController.swift
//  PersonalDiary-Group3
//
//  Created by Konda,Soumya on 4/19/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var users_list = users
    var sid = ""
    var isValidUser = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        let filteredNames = users_list.filter { name in
            return name.userName==userName.text
        }
        print("filteredNames",filteredNames)
        if filteredNames.count > 0 {
            // There is at least one user with a matching user name
            sid=filteredNames[0].userName
            isValidUser=true
        } else {
            // No user with a matching user name found
            isValidUser=false
            let alert = UIAlertController(title: "Failed", message: "Invalid User! Please try with proper credentials", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Done", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if isValidUser {
            
            if transition == "ListSegue" {
                let destination = segue.destination as! DiaryListViewController
                destination.SID = sid
            }
        }else
        {
            
        }
        
    }
}
