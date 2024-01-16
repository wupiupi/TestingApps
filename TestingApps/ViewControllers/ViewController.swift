import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    
    @IBOutlet var resultValueLabel: UILabel!
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.maxVal = maximumValueLabel.text
        settingsVC?.minVal = minimumValueLabel.text
    }
    
    @IBAction func generateButtonAction() {
        let minVal = Int(minimumValueLabel.text ?? "") ?? 0
        let maxVal = Int(maximumValueLabel.text ?? "") ?? 100
        
        resultValueLabel.text = Int.random(in: minVal...maxVal).formatted()
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let settingsVC = segue.source as? SettingsViewController
        maximumValueLabel.text = settingsVC?.maxValueTF.text
        minimumValueLabel.text = settingsVC?.minValueTF.text
    }
    
}

private extension ViewController {
    func showAlert() {
        let alert = UIAlertController(
            title: "Error",
            message: "min cannot be more than max",
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: "Ok",
            style: .default) { _ in
                self.minimumValueLabel.text = "0"
                self.maximumValueLabel.text = "100"
            }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}
