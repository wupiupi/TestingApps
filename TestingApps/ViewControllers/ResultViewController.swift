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
        
        getResult(with: answers)
    }
    
    @IBAction func doneButtonDidTapped() {
        dismiss(animated: true)
    }
}

private extension ResultViewController {
    func getResult(with answers: [Answer]) {
        
        /*
         let mostFrequentAnimal = Dictionary(grouping: answers) { $0.animal }
            .sorted { $0.value.count > $1.value.count }.first?.key
         */
        
        var answersCounter: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            answersCounter[animal, default: 0] += 1
        }
        
        let sortedAnswersCounter = answersCounter.sorted { $0.value > $1.value }
        guard let resultAnimal = sortedAnswersCounter.first?.key else { return }
        
        updateLabels(with: resultAnimal)
    }
    
    func updateLabels(with animal: Animal) {
        animalTypeLabel.text = String(animal.rawValue)
        animalDescriptionLabel.text = animal.description
    }
}
