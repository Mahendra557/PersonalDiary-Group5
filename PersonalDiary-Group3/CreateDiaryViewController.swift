//
//  CreateDiaryViewController.swift
//  PersonalDiary-Group3
//
//  Created by Konda,Soumya on 4/25/23.
//

import UIKit

class CreateDiaryViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var dateOL: UIDatePicker!
    
    @IBOutlet weak var titleOL: UITextField!
    
    var diary = DiaryModel()
    @IBOutlet weak var descOL: UITextView!
    
    
    @IBOutlet weak var imageOL: UIImageView!
    
    var diaryList : [DiaryModel] = []
    var dateText = ""
    var s_id = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dateOL.date)
        let dateFormatter = DateFormatter()
        
        // Set the date format
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        // Convert the date selected in the UIDatePicker to a string in the desired format
        let dateString = dateFormatter.string(from: dateOL.date)
        
        // Set the label text to the formatted string
        dateText = dateString
        diary.SID = s_id
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pickPhotoClick(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self // new
        present(imagePickerVC, animated: true)
    }
    
    @IBAction func saveDiaryOL(_ sender: Any) {
        
    }
    
    @IBAction func emojiClick(_ sender: Any) {
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     picker.dismiss(animated: true, completion: nil)
     let path = info[UIImagePickerController.InfoKey.mediaURL] as? NSURL
     //print(path!)
     if let image = info[.originalImage] as? UIImage {
     imageOL.image = image
     }
     }
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     picker.dismiss(animated: true, completion: nil)
     
     if let image = info[.originalImage] as? UIImage {
     imageOL.image = image
     }
     }
     
     */
    /**
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     picker.dismiss(animated: true, completion: nil)
     if let image = info[.originalImage] as? UIImage {
     imageOL.image = image
     let imageName = UUID().uuidString // generate a unique name for the image
     if let jpegData = image.jpegData(compressionQuality: 0.8), let url = Bundle.main.url(forResource: imageName, withExtension: "jpg", subdirectory: "Assets.xcassets") {
     do {
     try jpegData.write(to: url)
     print("Image saved successfully: \(url)")
     } catch {
     print("Error saving image:", error.localizedDescription)
     }
     }
     }
     }
     
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     picker.dismiss(animated: true, completion: nil)
     if let image = info[.originalImage] as? UIImage {
     imageOL.image = image
     let imageName = UUID().uuidString // generate a unique name for the image
     
     if let jpegData = image.jpegData(compressionQuality: 0.8) {
     let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
     let fileURL = documentsDirectory.appendingPathComponent("\(imageName).jpg")
     print("fileURL",fileURL)
     do {
     try jpegData.write(to: fileURL)
     print("Image saved successfully: \(fileURL)")
     } catch {
     print("Error saving image:", error.localizedDescription)
     }
     }
     }
     }        */
    
    /**    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     picker.dismiss(animated: true, completion: nil)
     if let image = info[.originalImage] as? UIImage {
         imageOL.image = image
         //saveImageToAssets(image: image)
         let imageName = UUID().uuidString + ".jpg" // generate a unique name for the image
         if let jpegData = image.jpegData(compressionQuality: 0.8) {
             let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
             do {
                 try jpegData.write(to: url)
                 // Save the image to the app's asset folder
                 print("asserts")
                 UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
             } catch {
                 print("not save asserts")
                 print("Error saving image:", error.localizedDescription)
             }
         }
     }
 }*/

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Use the image selected by the user
            imageOL.image = image
            
            // Save the image to the app's asset catalog
            saveImageToAssets(image: image)
            
            // Dismiss the image picker controller
            picker.dismiss(animated: true, completion: nil)
        }
    }
    func saveImageToAssets(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 1.0),
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                return
        }
        let fileName = "myImage.jpg"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)

        do {
            try imageData.write(to: fileURL)
            let assetsURL = Bundle.main.resourceURL?.appendingPathComponent(fileName)
            try FileManager.default.copyItem(at: fileURL, to: assetsURL!)
            print("Image saved to assets!")
        } catch {
            print("Error saving image to assets: \(error.localizedDescription)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "successSegue" {
            let destination = segue.destination as! SuccessViewController
            destination.s_id=s_id
            //diary.id = notesList.count + 1
            diary.date = dateText
            diary.title = titleOL.text!
            diary.description = titleOL.text!
            diary.image = "default"
            diaryList.append(diary)
            //print(diaryList)
            destination.diaryList = diaryList
        }
    }
}
