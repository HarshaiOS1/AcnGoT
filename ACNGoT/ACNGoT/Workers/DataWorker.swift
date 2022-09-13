//
//  DataWorker.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation

protocol CategoryDataProtocol {
    func fetchCategories(request: Categories.FetchCategories.Request, completionHandler: @escaping ([Category]?, Error?) -> Void)
}

class DataWorker {
    var categoriesAPI: CategoriesAPI
    init (categoriesAPI: CategoriesAPI) {
        self.categoriesAPI = categoriesAPI
    }
    
    func fetchCategories(request: Categories.FetchCategories.Request, completionHandler: @escaping ([Category]?, Error?) -> Void) {
        if let data = UserDefaults.standard.value(forKey: Constants.userdefaultKeys.categories.rawValue) {
            do {
                if let _data = data as? Data {
                    let categories = try JSONDecoder().decode(Categories.FetchCategories.Response.self, from: _data)
                    print(categories)
                    completionHandler(categories,nil)
                } else {
                    categoriesAPI.fetchCategories(request: request) { categories, error in
                        completionHandler(categories, error)
                    }
                }
            } catch  {
                completionHandler(nil,"error decoding data" as? Error)
            }
        } else {
            categoriesAPI.fetchCategories(request: request) { categories, error in
                completionHandler(categories, error)
            }
        }
    }
}
