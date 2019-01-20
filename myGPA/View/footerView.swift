//
//  footerView.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

///Contains a plus (+) button that is used to add new semesters. Used as a footer in the tableview shwing semesters.
class FooterView: UIView {
    
    @IBOutlet weak var addButton: UIButton!

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    ///Any customization to this view should be done inside this function.
    private func customizeView()
    {
        addButton.layer.cornerRadius = addButton.frame.size.width / 2
    }    
}
