//
//  DetailViewController.swift
//  PersonalDiary-Group3
//
//  Created by Konda,Soumya on 4/19/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleOL: UILabel!
    
    
    
    @IBOutlet weak var imageOL: UIImageView!
    //var desc=""
    //var strtitle=""
    var diaryData = DiaryModel()
    //@IBOutlet weak var diaryDescLblOL: UILabel!
    
    @IBOutlet weak var descTextViewOL: UITextView!
    
    var diaryList : [DiaryModel] = []
    var s_id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleOL.text=diaryData.title
        descTextViewOL.text=diaryData.description
        
        imageOL.image = UIImage(named: diaryData.image)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func deleteClick(_ sender: Any) {
       
        
    }
    

    @IBAction func ReturnToHomeClick(_ sender: Any) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        
        if transition == "GoToHomePageSegue" {
            let destination = segue.destination as! DiaryListViewController
            print("GoToHomePageSegue",diaryList,s_id)
            destination.diaryDataListById = diaryList
            destination.SID = s_id
            destination.isDeleteBtnClick=false
        }
        if transition == "deletebtnSegue" {
            let destination = segue.destination as! DiaryListViewController
            print("before delete",diaryList.count)
            let filteredDataById = diaryList.removeAll { item in
                item.id==diaryData.id
            }
            print("after delete",diaryList.count)
            //let alert = UIAlertController(title: "Delete⛔️", message: "Deleted Successfully!", preferredStyle: .alert)
           // let okAction = UIAlertAction(title: "Done", style: .default, handler: nil)
           // alert.addAction(okAction)
            //present(alert, animated: true, completion: nil)
            print("GoToHomePageSegue",diaryList,s_id)
            destination.diaryDataListById = diaryList
            destination.SID = s_id
            destination.isDeleteBtnClick=true
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
