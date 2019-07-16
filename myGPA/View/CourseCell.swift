//
//  CourseCell.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 7/13/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit
/// A UICollectionViewCell containing information about the courses to be added later
class CourseCell: UICollectionViewCell {
    
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseGradeLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var backView: UIView!
    
    var deleteBtnAction : (()->())? // Callback closure (for the removal of the cell by AddSemesterVC)
    let colors = [#colorLiteral(red: 0.5450980392, green: 0.7647058824, blue: 0.2901960784, alpha: 1), #colorLiteral(red: 1, green: 0.7568627451, blue: 0.02745098039, alpha: 1), #colorLiteral(red: 1, green: 0.2392156863, blue: 0.2392156863, alpha: 1), #colorLiteral(red: 0, green: 0.5921568627, blue: 0.9019607843, alpha: 1), #colorLiteral(red: 0.6117647059, green: 0.5333333333, blue: 1, alpha: 1), #colorLiteral(red: 0.8313068504, green: 0.9432106599, blue: 0.04864827069, alpha: 1)]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeCell()
    }
    
    func customizeCell(){
        self.clipsToBounds = false
        backView.layer.cornerRadius = 15
        backView.layer.backgroundColor = colors[.random(in: 0...colors.count - 1)].cgColor
        deleteBtn.layer.cornerRadius = deleteBtn.frame.size.width / 2
    }
    
    func updateCell(course: Course)
    {
        courseNameLabel.text = course.name
        courseGradeLabel.text = course.grade
    }
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
        deleteBtnAction?()
    }
}
