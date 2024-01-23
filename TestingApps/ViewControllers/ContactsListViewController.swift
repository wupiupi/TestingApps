//
//  ContactsListViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 23.01.24.
//

import UIKit

final class ContactsListViewController: UITableViewController {
    
    // MARK: - Properties
    var contacts: [Contact]!
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactIndex = tableView.indexPathForSelectedRow?.row else { return }
        
        let contactDetailsVC = segue.destination as? ContactDetailsViewController
        contactDetailsVC?.contact = contacts[contactIndex]
    }
}

// MARK: -  UITableViewDataSource
extension ContactsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = contacts[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        
        cell.contentConfiguration = content
        return cell
    }
}
