//
//  Semester.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

///A struct used for combining Name, GPA, Courses and Grades of a university semester.
struct Semester {
    private(set) public var name: String
    private(set) public var gpa: Double
    private(set) public var courses: [String]
    private(set) public var grades: [String]
    
    
    init(name: String, gpa: Double, classes: [String], grades: [String]) {
        self.name = name
        self.gpa = gpa
        self.courses = classes
        self.grades = grades
    }
}
