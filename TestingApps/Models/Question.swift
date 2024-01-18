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
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какую пищу Вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .rabbit),
                    Answer(title: "Кукуруза", animal: .turtle)
                ]
            ),
            Question(
                title: "Что Вам нравится больше?",
                type: .multiple,
                answers: [
                    Answer(title: "Плавать", animal: .dog),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Обниматься", animal: .rabbit),
                    Answer(title: "Есть", animal: .turtle)
                ]
            ),
            Question(
                title: "Любите ли Вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Нервничаю", animal: .rabbit),
                    Answer(title: "Не замечаю", animal: .turtle),
                    Answer(title: "Обожаю", animal: .dog)
                ]
            )
        ]
    }
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
