//
//  AlertViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 10.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    

    @IBAction func button(_ sender: Any) {

        let alert = UIAlertController(title: "Title", message: "Message Content", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
