//
//  QuesitonsViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 18.01.24.
//

import UIKit

final class QuestionsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    // MARK: - Private Properties
    private var questionIndex = 0
    private var chosenAnswers: [Answer] = []
    private let questions = Question.getQuestions()
    
    private var currentQuestion: Question {
        questions[questionIndex]
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupSlider()
    }
    
    // MARK: - IB Actions
    @IBAction func singleButtonDidTapped(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        chosenAnswers.append(currentQuestion.answers[buttonIndex])
        
        nextQuestion()
    }
    
    @IBAction func multipleButtonDidTapped() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentQuestion.answers) {
            if multipleSwitch.isOn {
                chosenAnswers.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonDidTapped() {
        let index = lrintf(rangedSlider.value)
        chosenAnswers.append(currentQuestion.answers[index])
        nextQuestion()
    }
    
}


// MARK: - Private Methods
private extension QuestionsViewController {
    func updateUI() {
        [singleStackView, multipleStackView, rangedStackView].forEach {
            $0?.isHidden = true
        }
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        questionLabel.text = currentQuestion.title
        
        let progress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(progress, animated: true)
        
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    func setupSlider() {
        let maxAnswersIndex = currentQuestion.answers.count - 1
        rangedSlider.maximumValue = Float(maxAnswersIndex)
        rangedSlider.value = rangedSlider.maximumValue / 2
    }
    
    func showCurrentAnswers(for questionType: QuestionType) {
        switch currentQuestion.type {
            case .single:
                showSingleStackView(with: currentQuestion.answers)
            case .multiple:
                showMultipleStackView(with: currentQuestion.answers)
            case .ranged:
                showRangedStackView(with: currentQuestion.answers)
        }
    }
    
    func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden.toggle()
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden.toggle()
        
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        questionIndex < questions.count
        ? updateUI()
        : performSegue(withIdentifier: "showResult", sender: nil)
    }
}
