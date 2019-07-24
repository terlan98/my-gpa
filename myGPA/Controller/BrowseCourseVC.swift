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

    // TODO: Make this VC appear on push and pop animation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.layer.cornerRadius = 15
    }
    
    @IBAction func dismissBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
