//
//  DetailViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 11.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selection:Int = -1

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        labelText.text = "Selection item \(selection)"
        
    }
    

}
