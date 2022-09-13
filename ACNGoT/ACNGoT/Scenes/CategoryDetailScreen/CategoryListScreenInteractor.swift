//
//  CategoryListScreenInteractor.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation

protocol CategoryListBusinessLogic {
    func fetchCategoryListDetails(request: URLRequest)
}

class CategoryListScreenInteractor: CategoryListBusinessLogic {
    var presenter: CategoryListPresentationLogic?
    var listDataWorker = ListDataWorker.init(categoriesAPI: CategoriesAPI())
    
    func fetchCategoryListDetails(request: URLRequest) {
        listDataWorker.fetchCategories(request: request) { data, error in
            if let _data = data {
                self.presenter?.presentFetchedListDetails(details: _data)
            }
        }
    }
}
