//
//  CategoryModels.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation
enum Categories {
    // MARK: Use cases
    enum FetchCategories {
        struct Request {
            
            func getRequest() -> URLRequest? {
                if let url = URL(string: "https://private-anon-81757c5574-androidtestmobgen.apiary-mock.com/categories") {
                    var request = URLRequest.init(url: url)
                    request.httpMethod = "GET"
                    return request
                }
                return nil
            }
        }
        
        struct Response {
            var category: [Category]
        }
        struct ViewModel {
            var categories : [Category]
        }
    }
}
