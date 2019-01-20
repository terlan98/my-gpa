//
//  DataService.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

///A singleton class containing all the data needed for the app to work properly.
class DataService
{
    static let instance = DataService()
    
//    private var semester = [Semester]()
    
    private var semester = [
        Semester(name: "Spring 2018", gpa: 3.87, classes: ["Calculus"], grades: ["A"]),
        Semester(name: "Fall 2019", gpa: 2.58, classes: ["History"], grades: ["B+"]),
        Semester(name: "Summer 2018", gpa: 1.83, classes: ["Leadership"], grades: ["B"])
    ]//Dummy Semester data
    
    ///Returns an array containing Semesters added by the user
    func getSemesters() -> [Semester]
    {
        return semester
    }
    
    ///Adds a new Semester to the semesters array
    func addSemester(name: String, gpa: Double, classes: [String], grades: [String])
    {
        semester.append(Semester(name: name, gpa: gpa, classes: classes, grades: grades))
    }
}
