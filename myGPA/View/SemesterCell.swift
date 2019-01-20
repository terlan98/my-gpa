//
//  SemesterCell.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit
//@IBDesignable
class SemesterCell: UITableViewCell {

    @IBOutlet weak var semesterName: UILabel!
    @IBOutlet weak var semesterGpa: UILabel!
    @IBOutlet weak var semesterBackground: UIView!
    
    private var bgColors = [#colorLiteral(red: 0.5450980392, green: 0.7647058824, blue: 0.2901960784, alpha: 1), #colorLiteral(red: 1, green: 0.7568627451, blue: 0.02745098039, alpha: 1), #colorLiteral(red: 1, green: 0.2392156863, blue: 0.2392156863, alpha: 1)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeCell()
    }
    
    ///Any customization to the SemesterCell should be done inside this function.
    func customizeCell(){
//        semesterBackground.backgroundColor = bgColors.randomElement()
    }
    
    ///Updates the name, GPA and background color of the SemesterCell according to a given Semester
    func updateCell(semester: Semester){
        semesterName.text = semester.name
        
        //Creating a NumberFormatter to properly format the GPA label (0.00)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        semesterGpa.text = formatter.string(from: NSNumber(value: semester.gpa))
        
        colorizeBackground()
    }
    
    ///Gives a color to the SemesterCell according to its GPA
    func colorizeBackground()//TODO: Complete this function
    {
        let gpa = (semesterGpa.text! as NSString).doubleValue
        
        if gpa > 3
        {
            semesterBackground.backgroundColor = bgColors[0]
        }
        else if gpa > 2
        {
            semesterBackground.backgroundColor = bgColors[1]
        }
        else
        {
            semesterBackground.backgroundColor = bgColors[2]
        }
        
    }
}
