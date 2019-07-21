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
    
    private var semesters = [Semester]()
    
//    private var semesters = [
//        Semester(name: "Spring 2018", gpa: 3.87, courses: ["Calculus"]),
//        Semester(name: "Fall 2019", gpa: 2.58, courses: ["History"]),
//        Semester(name: "Summer 2018", gpa: 1.83, courses: ["Leadership"])
//    ]//Dummy Semester data
    
    ///Returns an array containing Semesters added by the user
    func getSemesters() -> [Semester]
    {
        return semesters
    }
    
    ///Adds a new Semester to the semesters array
    func addSemester(semester: Semester)
    {
        semesters.append(semester)
    }
    
    ///Replaces a semester with a new one
    func replaceSemester(at index: Int, with semester: Semester)
    {
        semesters[index] = semester
    }
}
