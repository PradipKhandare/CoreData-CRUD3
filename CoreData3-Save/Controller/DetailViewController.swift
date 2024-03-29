//
//  DetailViewController.swift
//  CoreData3-Save
//
//  Created by NTS on 17/01/24.
//

import UIKit

protocol InsertData {
    func data(object: [String: String], index: Int, isEdit: Bool)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var delegate : InsertData!
    
    var student = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
        student = DatabaseHelper.dbObject.getData()!
    }

}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.student = student[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            student = DatabaseHelper.dbObject.deleteData(index: indexPath.row)!
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":student[indexPath.row].name,
                    "mobile": student[indexPath.row].mobile,
                    "rollNumber": student[indexPath.row].rollNumber,
                    "address": student[indexPath.row].address,
                    "dob": student[indexPath.row].dob]
        delegate.data(object: dict as! [String: String], index: indexPath.row, isEdit: true)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}


