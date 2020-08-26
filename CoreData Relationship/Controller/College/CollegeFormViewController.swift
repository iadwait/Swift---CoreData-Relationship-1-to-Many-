//
//  CollegeFormViewController.swift
//  CoreData Relationship
//
//  Created by Adwait Barkale on 19/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CollegeFormViewController: UIViewController {

    @IBOutlet weak var txtCollegeName: UITextField!
    @IBOutlet weak var txtCollegeAddress: UITextField!
    @IBOutlet weak var txtCollegeCity: UITextField!
    @IBOutlet weak var txtCollegeUniversity: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    var isUpdate = false
    var curIndex = Int()
    var collegeDetail: College?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if isUpdate{
            txtCollegeName.text = collegeDetail?.name
            txtCollegeAddress.text = collegeDetail?.address
            txtCollegeCity.text = collegeDetail?.city
            txtCollegeUniversity.text = collegeDetail?.university
            btnSave.setTitle("Update", for: .normal)
        }else{
            btnSave.setTitle("Save", for: .normal)
        }
    }

  
}

//MARK:- Actions
extension CollegeFormViewController{
    @IBAction func btnSaveClicked(_ sender: UIButton) {
        self.collegeSaveData()
        self.navigationController?.popViewController(animated: true)
      }
    
}

//MARK:- Methods
extension CollegeFormViewController{
    
    func collegeSaveData()
    {
        guard let collegeName = txtCollegeName.text else { return }
        guard let collegeAddress = txtCollegeAddress.text else { return }
        guard let collegeCity = txtCollegeCity.text else { return }
        guard let collegeUniversity = txtCollegeUniversity.text else { return }
        
        let collegeDict = [
            "collegeName": collegeName,
            "collegeAddress": collegeAddress,
            "collegeCity": collegeCity,
            "collegeUniversity": collegeUniversity,
        ]
        
        if isUpdate{
            DatabaseHelper.shared.updateCollegeData(collegeDict: collegeDict, index: curIndex)
            isUpdate = false
        }else{
             DatabaseHelper.shared.saveCollegeData(CollegeDict: collegeDict)
        }
       
    }
    
}
