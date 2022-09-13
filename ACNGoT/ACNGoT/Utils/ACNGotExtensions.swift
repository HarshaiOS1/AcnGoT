//
//  ACNGotExtensions.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation

extension JSONDecoder {
    func decode(possibleTypes : [Decodable.Type], from data: Data) -> Any? {
        for type in possibleTypes {
            if let value = type.decode(data: data, decoder: self) {
                return value
            }
        }
        return nil
    }
}

extension Decodable {
    static func decode(data : Data, decoder : JSONDecoder = JSONDecoder()) -> Self? {
        return try? decoder.decode(Self.self, from: data)
    }
}
