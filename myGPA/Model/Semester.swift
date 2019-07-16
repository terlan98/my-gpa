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
    private(set) public var courses: [Course]
    
    
    init(name: String, gpa: Double, courses: [Course]) {
        self.name = name
        self.gpa = gpa
        self.courses = courses
    }
}
