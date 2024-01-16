//
//  ViewController.swift
//  CoreData3-Save
//
//  Created by NTS on 16/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtRollNumber: UITextField!
    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet var allTextFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let dictOfData = ["name":txtName.text!, "rollNumber":txtRollNumber.text!, "dob": txtDOB.text!, "mobile": txtMobile.text!, "address": txtAddress.text!]
        DatabaseHelper.dbObject.saveData(obj: dictOfData)
        
        for textField in allTextFields {
            textField.text = ""
        }
    }
    
}

