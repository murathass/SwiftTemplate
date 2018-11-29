//
//  ImageViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 10.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController{

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imageChange))
        imageView.addGestureRecognizer(gesture)
        
    }
    
    
    @objc func imageChange(){
        
        if imageView.image == UIImage(named: "james"){
            imageView.image = UIImage(named: "kirk")
        }else if imageView.image == UIImage(named: "kirk"){
            imageView.image = UIImage(named: "james")
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
