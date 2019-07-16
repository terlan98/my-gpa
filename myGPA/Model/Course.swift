//
//  Course.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 7/13/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

struct Course {
    private(set) public var name: String
    private(set) public var grade: String
    private(set) public var credit: Double
    
    init(name: String, grade: String, credit: Double) {
        self.name = name
        self.grade = grade
        self.credit = credit
    }
}
