//
//  CollegeListViewCell.swift
//  CoreData Relationship
//
//  Created by Adwait Barkale on 19/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CollegeListViewCell: UITableViewCell {

    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblCollegeCity: UILabel!
    @IBOutlet weak var lblCollegeUniversity: UILabel!
    
    var college:College?{
        didSet{
            lblCollegeName.text = "College Name = \(college?.name ?? "")"
            lblCollegeCity.text = "College City = \(college?.city ?? "")"
            lblCollegeUniversity.text = "College University = \(college?.university ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
