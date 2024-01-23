//
//  TabBarViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 23.01.24.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
}

private extension TabBarViewController {
    func fetchData() {
        
        guard let contactsListVC = viewControllers?
            .first as? ContactsListViewController else {
            return
        }
        guard let contactsSectionsVc = viewControllers?
            .last as? ContactsSectionsViewController else {
            return
        }
        
        let contacts = Contact.getContacts()
        contactsListVC.contacts = contacts
        contactsSectionsVc.contacts = contacts
    }
}
