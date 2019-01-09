//
//  Semester.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

struct Semester
{
    private(set) public var name: String
    private(set) public var gpa: Double
    
    init(name: String, gpa: Double) {
        self.name = name
        self.gpa = gpa
    }
}
