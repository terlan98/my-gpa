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
    
    ///List of possible grades to choose from
    let gradeScheme1 = ["A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "D-", "F", "P", "NP"]
    let numericalGradeScheme1 = [4.0, 3.7, 3.3, 3.0, 2.7, 2.3, 2.0, 1.7, 1.3, 1.0, 0.7, 0.0]
    
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
    
    ///Deletes the semester at the given index
    func deleteSemester(index: Int)
    {
        semesters.remove(at: index)
    }
}
