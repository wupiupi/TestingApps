import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    
    @IBOutlet var resultValueLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
