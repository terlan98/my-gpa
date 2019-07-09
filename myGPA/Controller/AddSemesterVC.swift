//
//  AddSemesterVC.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/10/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

protocol AddSemesterDelegate// TODO: Complete this protocol
{
    func addSemester(semester: Semester)
}

///Used for creating new Semester object
class AddSemesterVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var semesterNameTxtField: UITextField!
    
    ///Courses that will be saved inside new Semester object
    var coursesToSave = [String]()
    
    var delegate: AddSemesterDelegate?
    
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath)
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
        if let currentCell = collectionView.cellForItem(at: indexPath) as? EmptyCourseCell
        {
            performSegue(withIdentifier: "AddCourseVC", sender: nil)
        }
    }
    
    @IBAction func saveBtnTapped(_ sender: Any)
    {
        // TODO: COMPLETE
        delegate?.addSemester(semester: Semester(name: semesterNameTxtField.text!, gpa: 4.0, classes: ["a"], grades: ["a"]))
        self.navigationController?.popViewController(animated: true)
    }
}
