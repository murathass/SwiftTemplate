//
//  UserDefaultViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 7.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class UserDefaultViewController: UIViewController {

    
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var secTF: UITextField!
    @IBOutlet weak var resTF: UILabel!
    var stand = UserDefaults.standard
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        stand.set(self.userTF.text, forKey: "name")
        stand.set(self.secTF.text, forKey: "last")
        stand.synchronize()
        self.resTF.text = "Ad Soyad : \(self.userTF.text!) \(self.secTF.text!)";
        
    }
    
    @IBAction func delete1(_ sender: Any) {
        stand.removeObject(forKey: "name")
        stand.removeObject(forKey: "last")
        stand.synchronize()
        self.resTF.text = "Ad Soyad : ";
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (stand.object(forKey: "name") as? String) != nil && (stand.object(forKey: "last") as? String) != nil {
            self.resTF.text = "Ad Soyad : \(stand.object(forKey: "name")!) \(stand.object(forKey: "last")!)";
        }
        
    }

    
    

    

}
