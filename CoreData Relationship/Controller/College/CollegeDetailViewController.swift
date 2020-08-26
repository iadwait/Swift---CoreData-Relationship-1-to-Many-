//
//  CollegeDetailViewController.swift
//  CoreData Relationship
//
//  Created by Adwait Barkale on 19/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CollegeDetailViewController: UITableViewController {
    
    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblCollegeAddress: UILabel!
    @IBOutlet weak var lblCollegeCity: UILabel!
    @IBOutlet weak var lblCollegeUniversity: UILabel!
    @IBOutlet var lblStudents: UILabel!
    
    var collegeDetail: College?
    var curIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        lblCollegeName.text = collegeDetail?.name
        lblCollegeAddress.text = collegeDetail?.address
        lblCollegeCity.text = collegeDetail?.city
        lblCollegeUniversity.text = collegeDetail?.university
    }
    
    @IBAction func btnEditClicked(_ sender: UIBarButtonItem) {
        let formVC = storyboard?.instantiateViewController(identifier: "CollegeFormViewController") as! CollegeFormViewController
        formVC.isUpdate = true
        formVC.collegeDetail = collegeDetail
        formVC.curIndex = curIndex
        self.navigationController?.pushViewController(formVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4
        {
            let studentListVC = storyboard?.instantiateViewController(identifier: "StudentListViewController") as! StudentListViewController
            studentListVC.college = collegeDetail
            navigationController?.pushViewController(studentListVC, animated: true)
        }
    }
    
}
