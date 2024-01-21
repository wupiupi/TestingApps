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
    
    // MARK: - Public Properties
    var color: UIColor!
    weak var delegate: SettingsViewControllerDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = color
        setupUI()
        updateSlidersValue(from: color)
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
    
    @IBAction func barButtonDidTapped(_ sender: UIBarButtonItem) {
        if sender.tag == 0 {
            delegate?.updateViewBackground(with: colorView.backgroundColor ?? .white)
        }
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
private extension SettingsViewController {
    func setupUI() {
        colorView.layer.cornerRadius = 16
        
        updateSlidersValue(from: color)
        
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
    
    func updateSlidersValue(from color: UIColor) {
        let ciColor = CIColor(color: color)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
}

// MARK: - CGFloat
private extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}
