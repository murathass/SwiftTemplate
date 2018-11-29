//
//  CustomTableDetailViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 1.10.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit
import CoreData

class CustomTableDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameEt: UITextField!
    @IBOutlet weak var artistEt: UITextField!
    @IBOutlet weak var yearEt: UITextField!
    
    
    var choosenImageName = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(CustomTableDetailViewController.imageClick))
        imageView.addGestureRecognizer(gesture)
        
        if choosenImageName != "" {
            self.nameEt.text = choosenImageName
        }
        
        getInfo()
    }
    
    func getInfo(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        let fecthRuqest = NSFetchRequest<NSFetchRequestResult>(entityName: "Painting");
        fecthRuqest.predicate = NSPredicate(format: "name = %@", self.choosenImageName)
        fecthRuqest.returnsObjectsAsFaults = false
        
        do{
            if let results = try context?.fetch(fecthRuqest){
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") {
                            self.nameEt.text = name as? String
                        }
                        
                        if let year = result.value(forKey: "year"){
                            self.yearEt.text = "\(year)"
                        }
                        
                        if let imag = result.value(forKey: "image"){
                            let data = imag as! Data
                            self.imageView.image = UIImage(data: data)
                        }
                        
                        
                        if let artist = result.value(forKey: "artist"){
                            self.artistEt.text = artist as? String
                        }
                        
                    }
                }
            }
        }catch{
            print("Veriler Getirilemiyor")
        }
    }
    
    
    @objc func imageClick(){
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker,animated: true,completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func save(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newArt = NSEntityDescription.insertNewObject(forEntityName: "Painting", into: context)
        
        if let artistText = self.artistEt.text {
            newArt.setValue(artistText, forKey:"artist");
        }
        
        if let nameText = self.nameEt.text {
            newArt.setValue(nameText, forKey:"name" );
        }
        
        if let yearText = self.yearEt.text {
            newArt.setValue(Int(yearText), forKey:"year");
        }
        
        if let imagedata = self.imageView.image?.jpegData(compressionQuality: 0.5) {
            newArt.setValue(imagedata, forKey:"image");
        }
        
        
        do{
            try context.save()
            print("Data Saved")
            self.dismiss(animated: true, completion: nil)
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
}
