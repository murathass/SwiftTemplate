//
//  CustomTableViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 13.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit
import CoreData

class CustomTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var names = [String]()
    var years = [Int]()
    var artists = [String]()
    var imagedatas = [Data]()
    
    var selectedName = ""

    @IBOutlet weak var artList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.artList.delegate = self
        self.artList.dataSource = self
        
        getInfo()
    }
    
    
    func getInfo(){
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        let fecthRuqest = NSFetchRequest<NSFetchRequestResult>(entityName: "Painting");
        fecthRuqest.returnsObjectsAsFaults = false
        
        do{
            if let results = try context?.fetch(fecthRuqest){
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") {
                            self.names.append(name as! String)
                        }
                        
                        if let year = result.value(forKey: "year"){
                            self.years.append(year as! Int);
                        }
                        
                        if let image = result.value(forKey: "image"){
                            self.imagedatas.append(image as! Data);
                        }
                        
                        
                        if let artist = result.value(forKey: "artist"){
                            self.artists.append(artist as! String)
                        }
                        
                        self.artList.reloadData();
                    }
                }
            }
        }catch{
            print("Veriler Getirilemiyor")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailCustom" {
            let ctdvc = segue.destination as! CustomTableDetailViewController
            ctdvc.choosenImageName =  self.selectedName
        }else if segue.identifier == "toFree" {
            self.selectedName = ""
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedName = self.names[indexPath.row]
        performSegue(withIdentifier: "toDetailCustom", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.names[indexPath.row]
        cell.imageView?.image = UIImage(data: self.imagedatas[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
}
