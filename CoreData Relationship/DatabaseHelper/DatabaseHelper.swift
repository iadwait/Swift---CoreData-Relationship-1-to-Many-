//
//  DatabaseHelper.swift
//  CoreData Relationship
//
//  Created by Adwait Barkale on 19/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {

    static let shared = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK:- College Database Functions
    
    func saveCollegeData(CollegeDict:[String:String])
    {
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = CollegeDict["collegeName"]
        college.address = CollegeDict["collegeAddress"]
        college.city = CollegeDict["collegeCity"]
        college.university = CollegeDict["collegeUniversity"]
        
        do{
            try context.save()
        }catch let err{
            print("Error Saving Data :- \(err.localizedDescription)")
        }
    }
    
    func getAllCollegeData() -> [College]
    {
        var arrCollege = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            arrCollege = try context.fetch(fetchRequest) as! [College]
        }catch let err{
            print("Error Fetching College Data:- \(err.localizedDescription)")
        }
        return arrCollege
    }
    
    func deleteCollegeData(index:Int) -> [College]
    {
        var arrCollege = getAllCollegeData()
        context.delete(arrCollege[index]) //Delete from CoreData
        //arrCollege.remove(at: index)
        arrCollege.removeAll()
        arrCollege = getAllCollegeData()
        do{
            try context.save()
        }catch let err{
            print("Error Deleting Data:- \(err.localizedDescription)")
        }
        return arrCollege
    }
    
    func updateCollegeData(collegeDict:[String:String],index:Int)
    {
        let arrCollege = getAllCollegeData()
        arrCollege[index].name = collegeDict["collegeName"]
        arrCollege[index].address = collegeDict["collegeAddress"]
        arrCollege[index].city = collegeDict["collegeCity"]
        arrCollege[index].university = collegeDict["collegeUniversity"]
        
        do{
            try context.save()
        }catch let err{
            print("Error Updating Data:- \(err.localizedDescription)")
        }
    }
    
    //MARK:- Student Database Functions
    
    func saveStudentData(StudentDict:[String:String],college:College)
    {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name = StudentDict["studentName"]
        student.email = StudentDict["studentEmail"]
        student.phone = StudentDict["studentPhone"]
        student.universities = college
        do{
            try context.save()
        }catch let err{
            print("Error Saving Student Data :- \(err.localizedDescription)")
        }
    }
    
    func getAllStudentData() -> [Student]
    {
        var arrStudent = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            arrStudent = try context.fetch(fetchRequest) as! [Student]
        }catch let err{
            print("Error Fetching Student Data:- \(err.localizedDescription)")
        }
        return arrStudent
    }}
