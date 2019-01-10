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
    
    private var bgColors = [#colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1), #colorLiteral(red: 0.5450980392, green: 0.7647058824, blue: 0.2901960784, alpha: 1), #colorLiteral(red: 1, green: 0.7568627451, blue: 0.02745098039, alpha: 1), #colorLiteral(red: 1, green: 0.3411764706, blue: 0.1333333333, alpha: 1), #colorLiteral(red: 1, green: 0.3215686275, blue: 0.3215686275, alpha: 1)]
    
    override func prepareForInterfaceBuilder() {
        customizeCell()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeCell()
    }
    
    func customizeCell(){
        semesterBackground.backgroundColor = bgColors.randomElement()
    }
    
    func updateCell(semester: Semester){
        semesterName.text = semester.name
        semesterGpa.text = "\(semester.gpa)"
        
        //semesterBackground.backgroundColor = asdfg
    }
}
