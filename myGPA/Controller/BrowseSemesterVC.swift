//
//  AddClassesController.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

///Shows info about a Semester chosen from MainVC
class BrowseSemesterVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CourseDelegate {
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    var semester: Semester!
    var semesterIndex: Int!
    var isEditModeEnabled = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    ///Initializes this ViewController according to a given Semester
    func initClassesVC(semester: Semester, index: Int){
        navigationItem.title = semester.name
        self.semester = semester
        self.semesterIndex = index
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(isEditModeEnabled) {return semester.courses.count + 1} // add 1 for '+' cell in editing mode
        return semester.courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == semester.courses.count) // Add a '+' cell if edit mode enabled
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmptyCourseCell", for: indexPath)
            return cell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! CourseCell
        cell.updateCell(course: semester.courses[indexPath.row], isDeletable: isEditModeEnabled)
        
        cell.deleteBtnAction = {
            self.semester.deleteCourse(at: indexPath.row)
            self.collectionView.deleteItems(at: [indexPath])
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // Play a cool animation during the appearance of an EmptyCourseCell
        if(cell as? EmptyCourseCell == nil) {return}
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        
        UIView.animate(withDuration: 0.3, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // If the user tapped an EmptyCourseCell
        if ((collectionView.cellForItem(at: indexPath) as? EmptyCourseCell) != nil)
        {
            performSegue(withIdentifier: "AddCourseVC", sender: nil)
        }
        else // Destination is BrowseCourseVC
        {
            if(isEditModeEnabled) {return}
            
            performSegue(withIdentifier: "BrowseCourseVC", sender: semester.courses[indexPath.row])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? AddCourseVC
        {
            dest.delegate = self
        }
        else // Destination is BrowseCourseVC
        {
            let dest = segue.destination as! BrowseCourseVC
            
            dest.initBrowseCoursesVC(course: sender as! Course)
        }
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
    
    func userDidSaveCourse(course: Course) {
        semester.addCourse(course: course)
        collectionView.reloadData()
    }
}
