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
    
    init(name: String, courses: [Course]) {
        self.name = name
        self.courses = courses
        self.gpa = 0.0 // temporary value
        calculateGPA()
    }
    
    /// Calculates the gpa of the semester
    mutating func calculateGPA()// TODO: Fix the func to ignore P and NP grades
    {
        var sum = 0.0
        var creditSum = 0.0
        
        for course in courses
        {
            let grade = course.grade
            let credit = course.credit
            
            sum += DataService.instance.numericalGradeScheme1[DataService.instance.gradeScheme1.firstIndex(of: grade)!] * credit
            creditSum += credit
        }
        self.gpa = sum / creditSum
    }
    
    mutating func deleteCourse(at index: Int)
    {
        courses.remove(at: index)
    }
    
    mutating func addCourse(course: Course)
    {
        courses.append(course)
    }
    
}
