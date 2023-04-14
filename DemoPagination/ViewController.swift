//
//  ViewController.swift
//  DemoPagination
//
//  Created by Ananth Nair on 06/04/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    
    

    
    @IBOutlet weak var tableList: UITableView!
    
    var recordArray : [Int] = Array()
    var limit = 20
    let totalEnteries = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableList.dataSource = self
        tableList.delegate = self
        
        var index = 0
        while  index < limit {
            recordArray.append(index)
            index = index + 1 
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Listcell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Listcell")
        }
        cell?.textLabel?.text = "Row \(recordArray[indexPath.row])"
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == recordArray.count - 1 {
            if recordArray.count < totalEnteries {
                var index = recordArray.count
                //limit  = index + 20
                index = 0 
                while  index < limit {
                    recordArray.append(index)
                    index = index + 1
                }
                self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
            }
        }
    }
    
    @objc func loadTable(){
        self.tableList.reloadData()
    }



}

