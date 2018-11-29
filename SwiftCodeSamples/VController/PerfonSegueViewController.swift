//
//  PerfonSegueViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 10.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class PerfonSegueViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segp1to2" {
            let ps2VC = segue.destination as! PerformSegue2ViewController
            ps2VC.name = name;
        }
    }
    
    @IBAction func go(_ sender: Any) {
        self.name = nameText.text!
        performSegue(withIdentifier: "segp1to2", sender: nil)
    }
 

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
