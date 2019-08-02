//
//  AddCourseVC.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/15/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

protocol CourseDelegate {
    func userDidSaveCourse(course: Course)
}

///Used as a pop-up in AddSemesterVC. Contains a text field for course name and a UIPickerView for grade
class AddCourseVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate: CourseDelegate? = nil
    
    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var gradePickerView: UIPickerView!
    @IBOutlet weak var creditTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradePickerView.delegate = self
        gradePickerView.dataSource = self
        
        courseNameTextField.becomeFirstResponder()
        hideKeyboardWhenTappedAround()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataService.instance.gradeScheme1.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.sizeToFit()
        label.text = String(DataService.instance.gradeScheme1[row])
        label.textAlignment = .center
        return label
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if(delegate == nil) {return}
        
        if(courseNameTextField.text == "")//play shake animation to signal the user about the course name
        {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                self.courseNameTextField.center.x += 10
            }, completion: nil)
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseIn, animations: {
                self.courseNameTextField.center.x -= 20
            }, completion: nil)
            UIView.animate(withDuration: 0.1, delay: 0.2, options: .curveEaseIn, animations: {
                self.courseNameTextField.center.x += 10
            }, completion: nil)
            
            return
        }
        else if (creditTextField.text == "")
        {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                self.creditTextField.center.x += 10
            }, completion: nil)
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseIn, animations: {
                self.creditTextField.center.x -= 20
            }, completion: nil)
            UIView.animate(withDuration: 0.1, delay: 0.2, options: .curveEaseIn, animations: {
                self.creditTextField.center.x += 10
            }, completion: nil)
            
            return
        }
        else
        {
            delegate?.userDidSaveCourse(course: Course(name: courseNameTextField.text!, grade: DataService.instance.gradeScheme1[gradePickerView.selectedRow(inComponent: 0)], credit: Double(creditTextField.text!)!))
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
