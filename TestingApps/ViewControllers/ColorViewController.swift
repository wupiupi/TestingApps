//
//  ColorViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 20.01.24.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func updateViewBackground(with color: UIColor)
}

final class ColorViewController: UIViewController {
    // MARK: - IB Outlet
    @IBOutlet var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationVC = segue.destination as? UINavigationController
        let settingsVC = navigationVC?.topViewController as? SettingsViewController
        
        settingsVC?.color = view.backgroundColor
        settingsVC?.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension ColorViewController: SettingsViewControllerDelegate {
    func updateViewBackground(with color: UIColor) {
        view.backgroundColor = color
    }
}
