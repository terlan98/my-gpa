//
//  EmptyClassCell.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/14/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class EmptyCourseCell: UICollectionViewCell
{
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var labelBackgroundView: UIView!

    override func awakeFromNib()
    {
        customizeCell()
    }
    
    func customizeCell()
    {
        self.setGradientBackgroundColor(colorOne: #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1), colorTow: #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1))
        layer.cornerRadius = 15
        
        innerView.layer.cornerRadius = 10
        
        labelBackgroundView.setGradientBackgroundColor(colorOne: #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1), colorTow: #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1))
        labelBackgroundView.layer.cornerRadius = labelBackgroundView.frame.size.width / 2
        labelBackgroundView.clipsToBounds = true
        
        plusLabel.textColor = UIColor.white
    }
}
