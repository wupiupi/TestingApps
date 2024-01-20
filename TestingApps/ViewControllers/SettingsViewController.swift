//
//  SettingsViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 20.01.24.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
  
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateView()
    }
    
    // MARK: - IB Actions
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender {
            case redSlider:
                redValueLabel.text = string(from: redSlider.value)
            case greenSlider:
                greenValueLabel.text = string(from: greenSlider.value)
            default:
                blueValueLabel.text = string(from: blueSlider.value)
        }
        updateView()
    }
    
}

// MARK: - Private Methods
private extension SettingsViewController {
    func setupUI() {
        colorView.layer.cornerRadius = 16
        
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        blueSlider.minimumTrackTintColor = .systemBlue
        
        redValueLabel.text = string(from: redSlider.value)
        greenValueLabel.text = string(from: greenSlider.value)
        blueValueLabel.text = string(from: blueSlider.value)
    }
    
    func string(from value: Float) -> String {
        String(format: "%.2f", value)
    }
    
    func updateView() {
        colorView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
}

// MARK: - CGFloat
private extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}
