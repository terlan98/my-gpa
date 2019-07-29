//
//  doubleWithoutTrailingZero.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 7/29/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

extension Double {
    var doubleToStringWithoutZeroFraction: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
