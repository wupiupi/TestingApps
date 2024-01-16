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
    
    
    @IBAction func generateButtonAction() {
        let minVal = Int(minimumValueLabel.text ?? "") ?? 0
        let maxVal = Int(maximumValueLabel.text ?? "") ?? 100
        
        resultValueLabel.text = Int.random(in: minVal...maxVal).formatted()
    }
    
}
