//
//  Course.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 7/13/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation
import UIKit

struct Course {
    private(set) public var name: String
    private(set) public var grade: String
    private(set) public var credit: Double
    private(set) public var color: UIColor
    
    private let colors = [#colorLiteral(red: 0.5905980371, green: 0.8321233951, blue: 0.3179059063, alpha: 1), #colorLiteral(red: 1, green: 0.7573653202, blue: 0.02946128072, alpha: 1), #colorLiteral(red: 1, green: 0.2392156863, blue: 0.2392156863, alpha: 1), #colorLiteral(red: 0, green: 0.5921568627, blue: 0.9019607843, alpha: 1), #colorLiteral(red: 0.6117647059, green: 0.5333333333, blue: 1, alpha: 1), #colorLiteral(red: 0.8046232265, green: 0.9111873414, blue: 0.05016313146, alpha: 1)]
    
    init(name: String, grade: String, credit: Double) {
        self.name = name
        self.grade = grade
        self.credit = credit
        
        color = colors[.random(in: 0...colors.count - 1)]
    }
}
