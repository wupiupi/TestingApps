//
//  Animation.swift
//  TestingApps
//
//  Created by Paul Makey on 30.01.24.
//

struct Animation {
    
    let animation: String
    let curve: String
    let force: Double
    let delay: Double
    let duration: Double
    
    var description: String {
        """
        Preset: \(animation)
        Curve: \(curve)
        Force: \(force.string())
        Delay: \(delay.string())
        Duration: \(duration.string())
        """
    }
    
    static var getAnimation: Animation {
        let data = DataSource.shared
        
        return Animation(
            animation: data.animations.randomElement()?.rawValue ?? "fadeIn",
            curve: data.animations.randomElement()?.rawValue ?? "spring",
            force: Double.random(in: 0...3),
            delay: Double.random(in: 0.1...2),
            duration: Double.random(in: 1...3)
        )
    }
}
