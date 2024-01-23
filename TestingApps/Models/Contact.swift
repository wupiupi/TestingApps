//
//  Contact.swift
//  TestingApps
//
//  Created by Paul Makey on 23.01.24.
//

struct Contact {
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getContacts() -> [Contact] {
        let data = DataStore()
        
        let names = Array(data.names)
        let surnames = Array(data.surname)
        let phoneNumbers = Array(data.phoneNumbers)
        let emails = Array(data.emails)
        
        let count = min(
            names.count,
            surnames.count,
            phoneNumbers.count,
            emails.count
        )
        
        let contacts = (0..<count).map { contactIndex in
            Contact(
                name: names[contactIndex],
                surname: surnames[contactIndex],
                phoneNumber: phoneNumbers[contactIndex],
                email: emails[contactIndex]
            )
        }
        return contacts
    }
}
