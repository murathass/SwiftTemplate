//
//  PerformSegue2ViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 10.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class PerformSegue2ViewController: UIViewController {

    @IBOutlet weak var nameSur: UILabel!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameSur.text = "Ad Soyad : \(name)"

    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
