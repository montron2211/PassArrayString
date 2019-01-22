//
//  ViewController.swift
//  PassArrayString
//
//  Created by duycuong on 1/22/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class MyClass {
    var string: String
    init(string: String) {
        self.string = string
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    var arrayString: [MyClass] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.text = arrayString.map{$0.string}.joined(separator: ",  ")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableVC = segue.destination as! TableViewController
        guard let text = textField.text else {return}
        arrayString = text.components(separatedBy: ",").map{MyClass(string: $0)}
        tableVC.data = arrayString
    }
    


}

