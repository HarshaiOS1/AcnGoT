//
//  Charectors.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation
struct Char: Codable {
    let id, name: String
    let gender: Gender
    let culture, born, died: String
    let titles, aliases: [String]
    let father, mother, spouse: String
    let allegiances: [String]
    let playedBy: [String]
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}

typealias Charectors = [Char]
