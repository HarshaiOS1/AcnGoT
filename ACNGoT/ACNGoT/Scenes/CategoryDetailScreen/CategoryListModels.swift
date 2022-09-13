//
//  CategoryListModels.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation

enum CategoryList {
    enum ListDetails {
        struct Request {
            static func getRequest(catType: Int) -> URLRequest? {
                let urlpart = String(format: Constants.getListDetail, catType)
                if let url = URL(string: Constants.baseurl + urlpart) {
                    var request = URLRequest.init(url: url)
                    request.httpMethod = "GET"
                    return request
                }
                return nil
            }
        }
        
        typealias Response = Any
        
//        struct Response {
//            typealias HouseResponse = [House]
//            typealias CharectorsResponse = [Char]
//            typealias BooksResponse = [Book]
//        }
        
        
    }
}
