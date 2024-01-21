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
  
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Public Properties
    var color: UIColor!
    weak var delegate: SettingsViewControllerDelegate?
    
    // MARK: - Public Getters
    lazy var toolbar: UIToolbar = {
        let tool: UIToolbar = .init(
            frame: .init(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: 35
            )
        )
        
        tool.barStyle = .default
        tool.isTranslucent = false
        tool.tintColor = .systemBlue
        tool.sizeToFit()
        
        let spaceArea: UIBarButtonItem = .init(systemItem: .flexibleSpace)
        let doneButton: UIBarButtonItem = .init(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButtonDidTapped)
        )
        
        tool.setItems([spaceArea, doneButton], animated: false)
        tool.isUserInteractionEnabled = true
        
        
        return tool
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = color
        setupUI()
        updateSlidersValue(from: color)
    }
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender {
            case redSlider:
                redLabel.text = string(from: redSlider.value)
                redTextField.text = string(from: redSlider.value)
            case greenSlider:
                greenLabel.text = string(from: greenSlider.value)
                greenTextField.text = string(from: greenSlider.value)
            default:
                blueLabel.text = string(from: blueSlider.value)
                blueTextField.text = string(from: blueSlider.value)
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

// MARK: - Actions
private extension SettingsViewController {
    @objc private func doneButtonDidTapped(sender: UIBarButtonItem) {
        for textField in [redTextField, greenTextField, blueTextField] {
            textField?.resignFirstResponder()
        }
    }
}

// MARK: - Work with UI
private extension SettingsViewController {
    func setupUI() {
        colorView.layer.cornerRadius = 16
        
        updateSlidersValue(from: color)
        
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        blueSlider.minimumTrackTintColor = .systemBlue
        
        updateLabels()
        updateTextFields()
        
        for textField in [redTextField, greenTextField, blueTextField] {
            textField?.delegate = self
            textField?.inputAccessoryView = toolbar
        }
    }
    
    func updateLabels() {
        redLabel.text = string(from: redSlider.value)
        greenLabel.text = string(from: greenSlider.value)
        blueLabel.text = string(from: blueSlider.value)
    }
    
    func updateTextFields() {
        redTextField.text = string(from: redSlider.value)
        greenTextField.text = string(from: greenSlider.value)
        blueTextField.text = string(from: blueSlider.value)
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

// MARK: - Private Methods
private extension SettingsViewController {
    func string(from value: Float) -> String {
        String(format: "%.2f", value)
    }
    
    func string(from string: String) -> String {
        String(format: "%.2f", string)
    }
    
    func dataValidation(for value: Float?) -> Bool {
        guard let value else { return false }
        return (0.0...1.0).contains(value) ? true : false
    }
    
    func showAlert() {
        let alert = UIAlertController(
            title: "Error",
            message: "Invalid data",
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "gotcha bae", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}

// MARK: - CGFloat
private extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let stringValue = textField.text else { return }
        
        if dataValidation(for: Float(stringValue)) {
            switch textField {
                case redTextField:
                    redSlider.setValue(Float(stringValue) ?? 0, animated: true)
                    redLabel.text = stringValue
                case greenTextField:
                    greenSlider.setValue(Float(stringValue) ?? 0, animated: true)
                    greenLabel.text = stringValue
                default:
                    blueSlider.setValue(Float(stringValue) ?? 0, animated: true)
                    blueLabel.text = stringValue
            }
        } else {
            showAlert()
            textField.text = "0.00"
        }
        
        updateView()
    }
}

