//
//  ViewController2.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 7.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
