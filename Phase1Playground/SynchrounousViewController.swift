//
//  StudentBViewController.swift
//  Phase1Playground
//
//  Created by Samar Seth on 4/5/20.
//  Copyright © 2020 Samar Seth. All rights reserved.
//

import UIKit

class SynchronousViewController: UIViewController {

    @IBOutlet weak var studentNameText: UILabel!
    @IBOutlet weak var studentBirthdate: UILabel!
    @IBOutlet weak var studentProgram: UILabel!
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var studentEmail: UILabel!
    @IBOutlet weak var studentCluster: UILabel!
    @IBOutlet weak var studentRoomInDorm: UILabel!
    @IBOutlet weak var dormLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let currentStudentID: Int = defaults.integer(forKey: "studentSync") {
            sleep(5)
            setSelectedStudent(to: currentStudentID)
        } else {
            sleep(5)
            setSelectedStudent(to: 5)
        }
    }
    
    func getSelectedStudent() -> Student {
            let defaults = UserDefaults.standard
            let currentStudentID: Int = defaults.integer(forKey: "studentSync")
            if currentStudentID == 1 {
                return Student.student1
            } else if currentStudentID == 2{
                return Student.student2
            } else if currentStudentID == 3{
                return Student.student3
            } else if currentStudentID == 4{
                return Student.student4
            } else {
                return Student.defaultStudent
            }
        }
        
        // Set the current student in UserDefaults
        func setSelectedStudent(to studentID: Int) {
            let defaults = UserDefaults.standard
            
            defaults.set(studentID, forKey: "studentSync")
                
            studentNameText.text = "\(getSelectedStudent().firstName) \(getSelectedStudent().lastName)"
                
            studentBirthdate.text = getSelectedStudent().birthdate
                
            studentProgram.text = getSelectedStudent().program
                
            self.studentID.text = "\(getSelectedStudent().bluecardNumber)"
                
            studentEmail.text = getSelectedStudent().email
                
            studentCluster.text  = getSelectedStudent().cluster
                
            if(getSelectedStudent().isDayStudent) {
                studentRoomInDorm.text = ""
                dormLabel.text = ""
            } else {
                studentRoomInDorm.text = "\(getSelectedStudent().dorm), # \(getSelectedStudent().roomNumber)"
                dormLabel.text = "Dorm:"
            }
        }
            
        @IBAction func changeStudentPressed(_ sender: UIButton) {
            // Create the alert controller
            let alert = UIAlertController(title: "Change student?", message: "", preferredStyle: .alert)
                
            // Create the actions
            let student1Action = UIAlertAction(title: "Student 1: \(Student.student1.firstName)", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.setSelectedStudent(to: 1)
            }
                
            let student2Action = UIAlertAction(title: "Student 2: \(Student.student2.firstName)", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.setSelectedStudent(to: 2)
            }
                
            let student3Action = UIAlertAction(title: "Student 3: \(Student.student3.firstName)", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.setSelectedStudent(to: 3)
            }
                
            let student4Action = UIAlertAction(title: "Student 4: \(Student.student4.firstName)", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.setSelectedStudent(to: 4)
            }
                
            // Add the actions
            alert.addAction(student1Action)
            alert.addAction(student2Action)
            alert.addAction(student3Action)
            alert.addAction(student4Action)
                
            // Present the controller
            self.present(alert, animated: true, completion: nil)
        }
    }
