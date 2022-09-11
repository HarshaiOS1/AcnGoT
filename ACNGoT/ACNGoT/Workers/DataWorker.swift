//
//  DataWorker.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation

protocol CategoryDataProtocol {
    func fetchCategories(request: Categories.FetchCategories.Request, completionHandler: @escaping ([Category], Error?) -> Void)
}

class DataWorker {
    //inject coredata as well
    var categoriesAPI: CategoriesAPI
    init (categoriesAPI: CategoriesAPI) {
        self.categoriesAPI = categoriesAPI
    }
    
    //check data in code data or call api method
    
    func fetchCategories(request: Categories.FetchCategories.Request, completionHandler: @escaping ([Category], Error) -> Void) {
        categoriesAPI.fetchCategories(request: request) { categories, error in
            print(categories)
            print(error)
        }
    }
}
