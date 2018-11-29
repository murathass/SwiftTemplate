//
//  TableViewController.swift
//  SwiftCodeSamples
//
//  Created by Murat Has on 11.09.2018.
//  Copyright © 2018 Hasworks. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var listitem = ["Elma","Armut","Şeftali","Karpuz","Kavun","Üzüm","Mango","Kivi"]
    var selection = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listitem.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = listitem[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        print("abc")
        
        if editingStyle == .delete {
            listitem.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        
        if editingStyle == .none {
            print("abd")
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selection = indexPath.row
        self.performSegue(withIdentifier: "segtable", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segtable" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.selection = self.selection
        }
    }
}
