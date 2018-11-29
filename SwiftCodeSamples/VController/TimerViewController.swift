//
//  TimerViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 10.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = String(counter)

        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(TimerViewController.repaetedFunc), userInfo: nil, repeats: true)
        
    }

    @objc func repaetedFunc(){
        counter = counter + 1
        textLabel.text = String(counter)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
