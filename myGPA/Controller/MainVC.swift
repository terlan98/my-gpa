//
//  ViewController.swift
//  myGPA
//
//  Created by Tarlan Ismayilsoy on 1/9/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, SemesterDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 120
    }
    
    // MARK: TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let semesterCount = DataService.instance.getSemesters().count
        if semesterCount == 0 { return 1 }//If there are no semesters, create one row for the EmptyCell
        return semesterCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let semesterCount = DataService.instance.getSemesters().count
        
        if semesterCount == 0 //If there are no semesters, show an EmptyCell with a message
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell")!
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SemesterCell
            
            cell.updateCell(semester: DataService.instance.getSemesters()[indexPath.row])
        
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if DataService.instance.getSemesters().count == 0 {return}//If there are no semesters, return without performing a segue

        let currentCell = tableView.cellForRow(at: indexPath) as? SemesterCell
        
        tableView.deselectRow(at: indexPath, animated: false)//So that the cell does not remain selected after the segue
        
        performSegue(withIdentifier: "BrowseClasses", sender: currentCell)
    }
    
    // MARK: Segue functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as? SemesterCell
        
        if let browseSemesterVC = segue.destination as? BrowseSemesterVC
        {
            browseSemesterVC.initClassesVC(semester: DataService.instance.getSemesters()[(tableView.indexPath(for: cell!)?.row)!])
        }
        else if let addSemesterVC = segue.destination as? AddSemesterVC
        {
            addSemesterVC.delegate = self
        }
    }

    func userDidSaveSemester(semester: Semester)
    {
        DataService.instance.addSemester(semester: semester)
        tableView.reloadData()
    }
}
