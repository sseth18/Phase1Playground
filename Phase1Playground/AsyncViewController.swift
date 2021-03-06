//
//  AsynchronousViewController.swift
//  Phase1Playground
//
//  Created by Samar Seth on 4/5/20.
//  Copyright © 2020 Samar Seth. All rights reserved.
//

import UIKit

class AsyncViewController: UIViewController {

    @IBOutlet weak var studentNameText: UILabel!
    @IBOutlet weak var studentBirthdate: UILabel!
    @IBOutlet weak var studentProgram: UILabel!
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var studentEmail: UILabel!
    @IBOutlet weak var studentCluster: UILabel!
    @IBOutlet weak var studentRoomInDorm: UILabel!
    @IBOutlet weak var dormLabel: UILabel!
    
    // stack views
    @IBOutlet weak var birthdateStack: UIStackView!
    @IBOutlet weak var studentIDStack: UIStackView!
    @IBOutlet weak var emailStack: UIStackView!
    @IBOutlet weak var programStack: UIStackView!
    @IBOutlet weak var clusterStack: UIStackView!
    @IBOutlet weak var dormStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .userInitiated).async {
            let defaults = UserDefaults.standard
            if let currentStudentID: Int = defaults.integer(forKey: "studentAsync") {
                    sleep(5)
                    DispatchQueue.main.async {
                        self.setSelectedStudent(to: currentStudentID)
                    }
                } else {
                    sleep(5)
                    DispatchQueue.main.async {
                        self.setSelectedStudent(to: 5)
                    }
                }
            }
        
        birthdateStack.isAccessibilityElement = true
        studentIDStack.isAccessibilityElement = true
        emailStack.isAccessibilityElement = true
        programStack.isAccessibilityElement = true
        clusterStack.isAccessibilityElement = true
        dormStack.isAccessibilityElement = true
        }
        
    func getSelectedStudent() -> Student {
        let defaults = UserDefaults.standard
        let currentStudentID: Int = defaults.integer(forKey: "studentAsync")
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
        
        defaults.set(studentID, forKey: "studentAsync")
            
        studentNameText.text = "\(getSelectedStudent().firstName) \(getSelectedStudent().lastName)"
            
        studentBirthdate.text = getSelectedStudent().birthdate
            
        studentProgram.text = getSelectedStudent().program
            
        self.studentID.text = "\(getSelectedStudent().bluecardNumber)"
            
        studentEmail.text = getSelectedStudent().email
            
        studentCluster.text  = getSelectedStudent().cluster
            
        if(getSelectedStudent().isDayStudent) {
            studentRoomInDorm.text = ""
            dormLabel.text = ""
            dormStack.isAccessibilityElement = false
        } else {
            let dorm = getSelectedStudent().dorm
            let roomNumber = getSelectedStudent().roomNumber
            
            studentRoomInDorm.text = "\(dorm), # \(roomNumber)"
            dormLabel.text = "Dorm:"
            
            dormStack.accessibilityLabel = "Dorm: " + dorm + " Room Number " + roomNumber
        }
        print(studentID)
        if studentID >= 1 && studentID <= 4 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            let birthdate = dateFormatter.date(from: studentBirthdate.text!)
            birthdateStack.accessibilityLabel = "Birthdate: " + DateFormatter.localizedString(from: birthdate!, dateStyle: .medium, timeStyle: .none)
            
            emailStack.accessibilityLabel = "Email: " + String(studentEmail.text![studentEmail.text!.index(studentEmail.text!.startIndex, offsetBy: 0)]) + " "
            let sliced = studentEmail.text!.suffix(studentEmail.text!.count - 1)
            emailStack.accessibilityLabel = emailStack.accessibilityLabel! + sliced
        } else {
            birthdateStack.accessibilityLabel = "Birthdate: "
            emailStack.accessibilityLabel = "Email: "
        }
        
        studentIDStack.accessibilityLabel = "Student ID: " + self.studentID.text!
        
        programStack.accessibilityLabel = studentProgram.text! + " Program"
        clusterStack.accessibilityLabel = studentCluster.text! + " Cluster"
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
        
        let dismiss = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel)
            
        // Add the actions
        alert.addAction(student1Action)
        alert.addAction(student2Action)
        alert.addAction(student3Action)
        alert.addAction(student4Action)
        alert.addAction(dismiss)
            
        // Present the controller
        self.present(alert, animated: true, completion: nil)
    }
}
