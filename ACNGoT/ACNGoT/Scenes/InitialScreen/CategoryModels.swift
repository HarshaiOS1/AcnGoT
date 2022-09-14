//
//  CategoryModels.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation
enum Categories {
    enum FetchCategories {
        struct Request {            
            func getRequest() -> URLRequest? {
                if let url = URL(string: Constants.baseurl+Constants.getCategories) {
                    var request = URLRequest.init(url: url)
                    request.httpMethod = "GET"
                    return request
                }
                return nil
            }
        }
        
        typealias Response = [Category]
        
        struct ViewModel {
            var categories : [Category]
        }
    }
}
