//
//  AddSemesterVC.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/10/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

protocol SemesterDelegate {
    func userDidSaveSemester(semester: Semester)
}

///Used for creating new Semester object
class AddSemesterVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CourseDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var semesterNameTxtField: UITextField!
    
    ///Courses that will be saved inside the new Semester object
    var coursesToSave = [Course]()
    
    var delegate: SemesterDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        semesterNameTxtField.becomeFirstResponder()
        hideKeyboardWhenTappedAround()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coursesToSave.count + 1 // +1 is for the cell containing '+' sign
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.row == coursesToSave.count // Create an EmptyCourseCell as the last element
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmptyCourseCell", for: indexPath)
            return cell
        }
        else // Create a CourseCell for each course
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! CourseCell
            cell.updateCell(course: coursesToSave[indexPath.row])
            return cell
        }
    }
    
    // size of cell:
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = UIScreen.main.bounds.width * 0.4373
        let cellHeight = UIScreen.main.bounds.height * 0.1874

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // If the user tapped an EmptyCourseCell
        if ((collectionView.cellForItem(at: indexPath) as? EmptyCourseCell) != nil)
        {
            performSegue(withIdentifier: "AddCourseVC", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? AddCourseVC
        {
            dest.delegate = self
        }
    }
    
    // Reload the collectionView after the user has added a new course
    func userDidSaveCourse(course: Course) {
        coursesToSave.append(course)
        collectionView.reloadData()
    }
    
    @IBAction func saveBtnTapped(_ sender: Any)
    {
        if(semesterNameTxtField.text == "")
        {
            let alert = UIAlertController(title: "Can't save", message: "Semester name cannot be empty", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        else if(coursesToSave.count == 0)
        {
            let alert = UIAlertController(title: "Can't save", message: "You should add at least one course to this semester", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        else
        {
            if(delegate == nil) {return}
            
            delegate?.userDidSaveSemester(semester: Semester(name: semesterNameTxtField.text!, gpa: 4.0, classes: ["a"], grades: ["a"]))
            self.navigationController?.popViewController(animated: true)
        }
    }
}
