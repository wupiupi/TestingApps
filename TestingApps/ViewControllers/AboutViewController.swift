//
//  AboutViewController.swift
//  TestingApps
//
//  Created by Paul Makey on 16.01.24.
//

import UIKit

final class AboutViewController: UIViewController {
    
    @IBOutlet var greetingLabel: UILabel!
    
    var username: String!
    
    private let greetings = [
        "Hello!",
        "Hi there!",
        "Hey!",
        "Howdy!",
        "Greetings!",
        "Salutations!",
        "Hey, what's up?",
        "Yo!",
        "Hiya!",
        "Aloha!",
        "Wassup?",
        "Bonjour!",
        "Hola!",
        "Ciao!",
        "Namaste!",
        "Konnichiwa!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomGreeting = greetings.randomElement() ?? "Hello!"
        greetingLabel.text = randomGreeting + " " + username
    }
}
