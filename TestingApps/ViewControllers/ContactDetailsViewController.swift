//
//  ContactDetailsViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 23.01.24.
//

import UIKit

final class ContactDetailsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var contactImageView: UIImageView!
    
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    // MARK: - Public Properties
    var contact: Contact!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        title = contact.fullName
        
        contactImageView.image = UIImage(named: "Person")
        contactImageView.layer.cornerRadius = contactImageView.frame.width / 2
        
        phoneNumberLabel.text = contact.phoneNumber
        emailLabel.text = contact.email
    }
}
