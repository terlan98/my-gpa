//
//  AddClassesController.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

///Shows info about a Semester chosen from MainVC
class BrowseSemesterVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    var semester: Semester!
    var semesterIndex: Int!
    var isEditModeEnabled = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.setEditing(false, animated: false)
    }

    ///Initializes this ViewController according to a given Semester
    func initClassesVC(semester: Semester, index: Int){
        navigationItem.title = semester.name
        self.semester = semester
        self.semesterIndex = index
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return semester.courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! CourseCell
        cell.updateCell(course: semester.courses[indexPath.row], isDeletable: isEditModeEnabled)
        
        cell.deleteBtnAction = {
            self.semester.deleteCourse(at: indexPath.row)
            self.collectionView.deleteItems(at: [indexPath])
        }

        return cell
    }
    
    @IBAction func editBtnTapped(_ sender: Any) {
        var newBtn: UIBarButtonItem
        
        if(!isEditModeEnabled)
        {
            isEditModeEnabled = true
            newBtn = UIBarButtonItem(barButtonSystemItem: .save, target: editBtn.target, action: editBtn.action)
            collectionView.reloadData()
        }
        else
        {
            isEditModeEnabled = false
            DataService.instance.replaceSemester(at: semesterIndex, with: semester)
            newBtn = UIBarButtonItem(barButtonSystemItem: .edit, target: editBtn.target, action: editBtn.action)
            collectionView.reloadData()
        }
        
        editBtn = newBtn
        self.navigationItem.rightBarButtonItem = editBtn
    }
}
