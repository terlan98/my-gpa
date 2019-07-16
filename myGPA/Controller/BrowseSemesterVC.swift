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
    
    @IBOutlet weak var collectionView: UICollectionView!
    var semester: Semester!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    ///Initializes this ViewController according to a given Semester
    func initClassesVC(semester: Semester){
        navigationItem.title = semester.name
        self.semester = semester
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return semester.courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! CourseCell
        cell.updateCell(course: semester.courses[indexPath.row])
        
        cell.deleteBtn.isEnabled = false // DO IT INSIDE THE COURSECELL
        cell.deleteBtn.isHidden = true // THIS ONE AS WELL !!!
        
        return cell
    }
}
