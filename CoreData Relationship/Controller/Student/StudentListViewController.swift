//
//  StudentListViewController.swift
//  CoreData Relationship
//
//  Created by Adwait Barkale on 19/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblViewStudentList: UITableView!
    
    var arrStudent = [Student]()
    var college: College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewStudentList.delegate = self
        tblViewStudentList.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       // arrStudent = DatabaseHelper.shared.getAllStudentData()
        if college?.students?.allObjects != nil{
            arrStudent = college?.students?.allObjects as! [Student]
        }
        tblViewStudentList.reloadData()
    }
    @IBAction func btnAddStudentClicked(_ sender: UIBarButtonItem) {
        let studentFormVC = storyboard?.instantiateViewController(identifier: "StudentFormViewController") as! StudentFormViewController
        studentFormVC.college = college
        navigationController?.pushViewController(studentFormVC, animated: true)
    }
}

extension StudentListViewController
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewStudentList.dequeueReusableCell(withIdentifier: "StudentListViewCell") as! StudentListViewCell
        cell.lblStudentName.text = arrStudent[indexPath.row].name
        cell.lblStudentEmail.text = arrStudent[indexPath.row].email
        cell.lblStudentPhone.text = arrStudent[indexPath.row].phone
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
