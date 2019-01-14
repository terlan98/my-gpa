//
//  AddSemesterVC.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/10/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class AddSemesterVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var semesterNameLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        semesterNameLabel.becomeFirstResponder()
        hideKeyboardWhenTappedAround()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmptyCourseCell", for: indexPath)
        return cell
    }
    
    //size of cell:
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = UIScreen.main.bounds.width * 0.4373
        let cellHeight = UIScreen.main.bounds.height * 0.1874

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
