//
//  ListDataWorker.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation

protocol CategoryListDetailProtocol {
    func fetchCategoyListDetails(request: URLRequest, completionHandler: @escaping (Any?, Error?) -> Void)
}

class ListDataWorker {
    var categoriesAPI: CategoriesAPI
    init (categoriesAPI: CategoriesAPI) {
        self.categoriesAPI = categoriesAPI
    }
    
    func fetchCategories(request: URLRequest, completionHandler: @escaping (Any?, Error?) -> Void) {
        categoriesAPI.fetchCategoyListDetails(request: request) { reponse, error in
            completionHandler(reponse,error)
        }
    }
}
