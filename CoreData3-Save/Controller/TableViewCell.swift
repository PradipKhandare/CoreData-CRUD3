//
//  TableViewCell.swift
//  CoreData3-Save
//
//  Created by NTS on 17/01/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelRollNumber: UILabel!
    @IBOutlet weak var labelDob: UILabel!
    @IBOutlet weak var labelMobile: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    var student : Student! {
        didSet {
            labelName.text = student.name
            labelRollNumber.text = student.rollNumber
            labelDob.text = student.dob
            labelMobile.text = student.mobile
            labelAddress.text = student.address
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
