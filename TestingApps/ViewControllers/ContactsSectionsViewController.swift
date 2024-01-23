//
//  ContactsSectionsViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 23.01.24.
//

import UIKit

final class ContactsSectionsViewController: UITableViewController {
    
    // MARK: - Public Properties
    var contacts: [Contact]!
}

// MARK: - UITableViewDataSource
extension ContactsSectionsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contacts[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactSection", for: indexPath)
        
        let contact = contacts[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
            case 0:
                content.text = contact.phoneNumber
                content.image = UIImage(systemName: "phone")
            default:
                content.text = contact.email
                content.image = UIImage(systemName: "tray")
        }
        
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactsSectionsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
