//
//  SettingsViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 16.01.24.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet var minValueTF: UITextField!
    @IBOutlet var maxValueTF: UITextField!
    
    var minVal: String!
    var maxVal: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minValueTF.text = minVal
        maxValueTF.text = maxVal
    }
    
    @IBAction func closeButtonAction() {
        dismiss(animated: true)
    }
}
