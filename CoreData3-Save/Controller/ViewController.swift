//
//  ViewController.swift
//  CoreData3-Save
//
//  Created by NTS on 16/01/24.
//

import UIKit

class ViewController: UIViewController, InsertData {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtRollNumber: UITextField!
    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet var allTextFields: [UITextField]!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let dictOfData = ["name":txtName.text!, "rollNumber":txtRollNumber.text!, "dob": txtDOB.text!, "mobile": txtMobile.text!, "address": txtAddress.text!]
        
        if isUpdate == true {
            DatabaseHelper.dbObject.updateData(object: dictOfData as! [String: String], i: i)
        }else {
            DatabaseHelper.dbObject.saveData(obj: dictOfData)
        }
        
        for textField in allTextFields {
            textField.text = ""
        }
    }
    
    @IBAction func viewDataButtonPressed(_ sender: UIButton) {
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        detailVC.delegate = self
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtName.text = object["name"]
        txtRollNumber.text = object["rollNumber"]
        txtDOB.text = object["dob"]
        txtMobile.text = object["mobile"]
        txtAddress.text = object["address"]
        i = index
        isUpdate = isEdit
    }
}

