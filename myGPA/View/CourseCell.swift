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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeCell()
    }
    
    func customizeCell(){
        self.clipsToBounds = false
        backView.layer.cornerRadius = 15
        deleteBtn.layer.cornerRadius = deleteBtn.frame.size.width / 2
    }
    
    func updateCell(course: Course, isDeletable: Bool)
    {
        courseNameLabel.text = course.name
        courseGradeLabel.text = course.grade
        backView.layer.backgroundColor = course.color.cgColor
        
        deleteBtn.isEnabled = isDeletable
        deleteBtn.isHidden = !isDeletable
        wiggleAnimationState(state: isDeletable)
    }
    
    func wiggleAnimationState(state: Bool)
    {
        if(!state) {return}
        
        let wiggleAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        wiggleAnim.duration = 0.15
        wiggleAnim.repeatDuration = .infinity
        wiggleAnim.autoreverses = true
        wiggleAnim.fromValue = NSNumber(value: -Double.pi * 0.01)
        wiggleAnim.toValue = NSNumber(value: Double.pi * 0.01)
        layer.add(wiggleAnim, forKey: "wiggle")
    }
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
        deleteBtnAction?()
    }
}
