//
//  footerView.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit


class FooterView: UIView {
    
    @IBOutlet weak var addButton: UIButton!

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }

    private func customizeView()
    {
        addButton.layer.cornerRadius = addButton.frame.size.width / 2
        addButton.titleLabel?.baselineAdjustment = .none
    }
    
    
}
