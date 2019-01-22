//
//  TableViewController.swift
//  PassArrayString
//
//  Created by duycuong on 1/22/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var data : [MyClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].string
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
//            tableView.reloadRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(title: "Sua du lieu tai vi tri \(indexPath.row)", message: "")
    }
    
    @IBAction func createNew(sender: UIBarButtonItem) {
        data.append(MyClass(string: "abc"))
        tableView.reloadData()
    }
    
    func showAlert(title:String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "nhap du lieu vao day ngay!"
        }
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { [unowned self] (result : UIAlertAction) -> Void in
            guard let selectedIndexpath = self.tableView.indexPathForSelectedRow else {return}
            self.data[selectedIndexpath.row].string = alertController.textFields?.first?.text ?? ""
            self.tableView.reloadData()
        }
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
