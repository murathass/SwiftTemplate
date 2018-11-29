//
//  ViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 7.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func button(_ sender: Any) {
        let randomInt = arc4random() % 2
        print(randomInt)
        
        if randomInt == 0 {
            self.performSegue(withIdentifier: "sega", sender: nil)
        }else{
            self.performSegue(withIdentifier: "segb", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

