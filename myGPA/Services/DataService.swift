//
//  DataService.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

class DataService
{
    static let instance = DataService()
    
//    private var semester = [Semester]()
    
    private var semester = [
        Semester(name: "Spring 2018", gpa: 3.87),
        Semester(name: "Fall 2019", gpa: 3.58),
        Semester(name: "Summer 2018", gpa: 2.20)
    ]
    
    func getSemesters() -> [Semester]
    {
        return semester
//        return [Semester]()
    }
    
    func addSemester(name: String, gpa: Double)
    {
        semester.append(Semester(name: name, gpa: gpa))
    }
}
