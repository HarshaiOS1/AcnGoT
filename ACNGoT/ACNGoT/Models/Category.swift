//
//  Category.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation
struct Category: Codable {
    let categoryName: String
    let type: Int
    
    enum CodingKeys: String, CodingKey {
        case categoryName = "category_name"
        case type
    }
}
