//
//  ListDataWorker.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation

protocol CategoryListDetailProtocol {
    func fetchCategories(request: URLRequest, completionHandler: @escaping ([Category]?, Error?) -> Void)
}

class ListDataWorker {
    var categoriesAPI: CategoriesAPI
    init (categoriesAPI: CategoriesAPI) {
        self.categoriesAPI = categoriesAPI
    }
    
    func fetchCategories(request: URLRequest, completionHandler: @escaping (Any?, Error?) -> Void) {
        categoriesAPI.fetchListDetails(request: request) { response, error in
            completionHandler(response,error)
        }
    }
}
