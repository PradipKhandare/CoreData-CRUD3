//
//  DatabaseHelper.swift
//  CoreData3-Save
//
//  Created by NTS on 16/01/24.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper
{
    static var dbObject = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func saveData(obj:[String: String]) {
        let candidate = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        candidate.name = obj["name"]
        candidate.address = obj["address"]
        candidate.mobile = obj["mobile"]
        candidate.dob = obj["dob"]
        candidate.rollNumber = obj["rollNumber"]
        
        do{
            try? context?.save()
        }catch {
            print("Data not saved successfully!! \(error)")
        }
    }
    
    //MARK: - Get Data
    func getData() -> [Student]? {
        var student = [Student]()
        let request = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do{
            student = try context?.fetch(request) as! [Student]
            try context?.save()
            return student
        }catch{
            print("error in getting the data")
            return nil
        }
    }
    
    //MARK: - Delete Data
    func deleteData(index: Int) -> [Student]? {
        var student = getData()
        context?.delete(student![index])
        student?.remove(at: index)
        do{
            try context?.save()
            return student
        }catch{
            print("Data note deleted successfully, Please try again.")
            return nil
        }
    }
}
