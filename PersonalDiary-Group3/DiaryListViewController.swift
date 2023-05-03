//
//  DiaryListViewController.swift
//  PersonalDiary-Group3
//
//  Created by Konda,Soumya on 4/19/23.
//

import UIKit

class DiaryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    //var diaryList1 = [DiaryModel]()
    
    var diaryData = DiaryModel()
    //Array of type Student, we imported it from the 'Student' file
    var diaryDataListById = [DiaryModel]()
    var diaryNotesAllList = notesList
    var SID = ""
    var isDeleteBtnClick=false
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryDataListById.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath as IndexPath) as! TableViewCell
        
            cell.imageCell.image = UIImage(named: diaryDataListById[indexPath .row].image)
            cell.titleCellOL.text = diaryDataListById[indexPath .row].title
            cell.descCellOL.text = diaryDataListById[indexPath .row].description
            cell.dateCellOL.text=diaryDataListById[indexPath .row].date
       
       
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        //print(diaryList)
        // Do any additional setup after loading the view.
        if isDeleteBtnClick {
            let alert = UIAlertController(title: "Delete⛔️", message: "Deleted Successfully!", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Done", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else
        {
            isDeleteBtnClick=false
        }
        if diaryDataListById.count==0 {
            let filteredDataById = diaryNotesAllList.filter { item in
                return item.SID==SID
            }
            diaryDataListById=filteredDataById;
            print("filteredDataById Sid Empty",filteredDataById.count)
        } else {
            // SID is not empty
            let filteredDataById = diaryDataListById.filter { item in
                return item.SID==SID
            }
            diaryDataListById=filteredDataById;
            print("filteredDataById SID not empty",filteredDataById.count)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "detailsSegue"{
            let destination = segue.destination as! DetailViewController
            var rowData=tableViewOutlet.indexPathForSelectedRow?.row
            //print(rowData!)
            //destination.desc = diaryList[(tableViewOutlet.indexPathForSelectedRow?.row)!].description
            destination.s_id = SID
            destination.diaryList=diaryDataListById
            destination.diaryData=diaryDataListById[(tableViewOutlet.indexPathForSelectedRow?.row)!]
            
        }
        else if transition == "createSegue"{
            let destination = segue.destination as! CreateDiaryViewController
            destination.s_id = SID
            destination.diaryList=diaryDataListById
            
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
