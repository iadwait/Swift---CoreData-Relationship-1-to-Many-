//
//  ViewController.swift
//  CoreData Relationship
//
//  Created by Adwait Barkale on 19/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CollecgeListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tblViewCollegeList: UITableView!
    var arrCollege = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewCollegeList.delegate = self
        tblViewCollegeList.dataSource = self
        //self.arrCollege = DatabaseHelper.shared.getAllCollegeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.arrCollege = DatabaseHelper.shared.getAllCollegeData()
        tblViewCollegeList.reloadData()
    }

    @IBAction func btnCollegeAddClicked(_ sender: UIBarButtonItem) {
        let collegeForm = storyboard?.instantiateViewController(identifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
    
}

extension CollecgeListViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewCollegeList.dequeueReusableCell(withIdentifier: "CollegeListViewCell") as! CollegeListViewCell
        cell.college = arrCollege[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collegeDetailVC = storyboard?.instantiateViewController(identifier: "CollegeDetailViewController") as! CollegeDetailViewController
        collegeDetailVC.collegeDetail = arrCollege[indexPath.row]
        collegeDetailVC.curIndex = indexPath.row
        self.navigationController?.pushViewController(collegeDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrCollege = DatabaseHelper.shared.deleteCollegeData(index: indexPath.row)
            tblViewCollegeList.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

