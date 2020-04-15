
import Foundation

public struct Student {
    let firstName: String
    let lastName: String
    let birthdate: String
    let email: String
    let bluecardNumber: String
    let program: String // LSI, Upper School, ACE, etc.
    let dorm: String
    let roomNumber: String // String because some rooms have letters, like "114a"
    let cluster: String
    let isDayStudent: Bool
    
    static let student1 = Student(
        firstName: "Joe",
        lastName: "Kerr",
        birthdate: "11/18/1420",
        email: "jkerr@andover.edu",
        bluecardNumber: "1898765",
        program: "PALS", // LSI, Upper School, ACE, etc.
        dorm: "",
        roomNumber: "", // String because some rooms have letters, like "114a"
        cluster: "Pine Knoll",
        isDayStudent: true
    )
    
    static let student2 = Student(
        firstName: "민지",
        lastName: "신",
        birthdate: "09/05/2004",
        email: "idontknow@gmail.com",
        bluecardNumber: "2001838",
        program: "Lower School, ELL", // LSI, Upper School, ACE, etc.
        dorm: "Isham",
        roomNumber: "103", // String because some rooms have letters, like "114a"
        cluster: "West Quad South",
        isDayStudent: false
    )
    
    static let student3 = Student(
        firstName: "Chaz",
        lastName: "Water",
        birthdate: "08/23/2003",
        email: "cwater20@andover.edu",
        bluecardNumber: "8347172",
        program: "Upper School", // LSI, Upper School, ACE, etc.
        dorm: "Carriage House",
        roomNumber: "103", // String because some rooms have letters, like "114a"
        cluster: "Abbot",
        isDayStudent: false
    )
    
    static let student4 = Student(
        firstName: "Opal",
        lastName: "West",
        birthdate: "03/30/2007",
        email: "owest@andover.edu",
        bluecardNumber: "3429470",
        program: "LSI", // LSI, Upper School, ACE, etc.
        dorm: "",
        roomNumber: "", // String because some rooms have letters, like "114a"
        cluster: "LSI",
        isDayStudent: true
    )
    
    static let defaultStudent = Student(
        firstName: "",
        lastName: "",
        birthdate: "",
        email: "",
        bluecardNumber: "",
        program: "", // LSI, Upper School, ACE, etc.
        dorm: "",
        roomNumber: "", // String because some rooms have letters, like "114a"
        cluster: "",
        isDayStudent: true
    )
}
