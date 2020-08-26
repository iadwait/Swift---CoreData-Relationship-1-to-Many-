//
//  StudentListViewCell.swift
//  CoreData Relationship
//
//  Created by Adwait Barkale on 19/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class StudentListViewCell: UITableViewCell {

    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblStudentEmail: UILabel!
    @IBOutlet weak var lblStudentPhone: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
