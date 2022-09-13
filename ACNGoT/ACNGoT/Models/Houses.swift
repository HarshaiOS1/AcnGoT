//
//  Houses.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation
struct House: Codable {
    let id, name, region, title: String
}

typealias Houses = [House]
