//
//  DataSource.swift
//  TestingApps
//
//  Created by Paul Makey on 30.01.24.
//

import SpringAnimation

final class DataSource {
    static let shared = DataSource()
    
    let animations = AnimationPreset.allCases
    let curves = AnimationCurve.allCases
    
    private init() {}
}
