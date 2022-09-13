//
//  Books.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation

struct Book: Codable {
    let name, isbn: String
    let authors: [String]
    let numberOfPages: Int
    let publisher, country, mediaType, released: String
}

typealias Books = [Book]
