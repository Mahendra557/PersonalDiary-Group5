//
//  SuccessViewController.swift
//  PersonalDiary-Group3
//
//  Created by Konda,Soumya on 4/25/23.
//

import UIKit

class SuccessViewController: UIViewController {

    var diaryList : [DiaryModel] = []
    var dList : [DiaryModel] = []
    var s_id = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ReturnToHomeClick(_ sender: Any) {
        dList = diaryList
        print(dList.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        
        if transition == "goToHomeSegue" {
            let destination = segue.destination as! DiaryListViewController
            print("goToHomeSegue",dList,s_id)
            destination.diaryDataListById = dList
            destination.SID = s_id
        }
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
