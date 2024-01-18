//
//  Question.swift
//  TestingApps
//
//  Created by Paul Makey on 18.01.24.
//

struct Question {
    let title: String
    let type: QuestionType
    let answers: [Answer]
    
}

enum QuestionType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "😼"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var description: String {
        switch self {
            case .dog:
                "You like to be with your friends. You're very reliable person"
            case .cat:
                "You like to make everything by urself and be alone"
            case .rabbit:
                "You like everything to be soft. You're healthy and funny person"
            case .turtle:
                "Turtle. You're turtle man. Like Raphael or Leonardo (i guess)"
        }
    }
}
