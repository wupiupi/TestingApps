//
//  MainViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 30.01.24.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var animationView: SpringView!
    @IBOutlet var infoLabel: UILabel!
    
    // MARK: - Private Properties
    private var animation = Animation.getAnimation
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.layer.cornerRadius = 20
        infoLabel.text = animation.description
    }
    
    // MARK: - IBActions
    @IBAction func doneButtonDidTapped(_ sender: UIButton) {
        animateView()
        
        sender.setTitle("Continue with: \(animation.animation)", for: .normal)
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func animateView() {
        infoLabel.text = animation.description
        
        animationView.animation = animation.animation
        animationView.curve = animation.curve
        animationView.delay = animation.delay
        animationView.duration = animation.duration
        animationView.force = animation.force
        
        animationView.animate()
        
        animation = Animation.getAnimation
    }
}
