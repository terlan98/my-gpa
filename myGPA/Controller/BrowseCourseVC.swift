//
//  BrowseCourseVC.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 7/24/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class BrowseCourseVC: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!

    private(set) public var course: Course?
    
    // TODO: Make this VC appear on push and pop animation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    @IBAction func dismissBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func initBrowseCoursesVC(course: Course)
    {
        self.course = course
    }
    
    func updateView()
    {
        backView.backgroundColor = course!.color
        nameLabel.text = course!.name
        creditLabel.text = "\(course!.credit.doubleToStringWithoutZeroFraction) credits"
        gradeLabel.text = course!.grade
        
        backView.layer.cornerRadius = 15
    }
}
