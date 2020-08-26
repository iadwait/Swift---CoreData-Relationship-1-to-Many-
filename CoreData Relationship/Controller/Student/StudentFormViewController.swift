//
//  StudentFormViewController.swift
//  CoreData Relationship
//
//  Created by Adwait Barkale on 19/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class StudentFormViewController: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPhone: UITextField!
    
    var college: College?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSaveClicked(_ sender: UIButton) {
        
        guard let name = txtName.text else { return }
        guard let email = txtEmail.text else { return }
        guard let phone = txtPhone.text else { return }
        guard let studCollege = college else{ return }
        
        let studentDict = [
            "studentName":name,
            "studentEmail":email,
            "studentPhone":phone
        ]
        DatabaseHelper.shared.saveStudentData(StudentDict: studentDict, college: studCollege)
        navigationController?.popViewController(animated: true)
    }
    

}
