//
//  ResultViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 18.01.24.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        updateResult(with: answers)
    }
    
    @IBAction func doneButtonDidTapped() {
        dismiss(animated: true)
    }
}

private extension ResultViewController {
    func updateResult(with answers: [Answer]) {
        
        var answersCounter: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            answersCounter[animal] = ((answersCounter[animal] ?? 0) + 1)
        }
        
        let sortedAnswersCounter = answersCounter.sorted { $0.value > $1.value }
        guard let resultAnimal = sortedAnswersCounter.first?.key else { return }
        
        animalTypeLabel.text = String(resultAnimal.rawValue)
        animalDescriptionLabel.text = resultAnimal.description
    }
}
