//
//  AddClassesController.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

///Shows info about a Semester chosen from MainVC
class BrowseSemesterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    ///Initializes this ViewController according to a given Semester
    func initClassesVC(semester: Semester){
        navigationItem.title = semester.name
    }
}
