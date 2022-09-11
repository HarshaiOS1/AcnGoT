//
//  IntialScreenInteractor.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import UIKit

protocol CategoryBusinessLogic {
    func fetchCategoryonLaunch(request: Categories.FetchCategories.Request)
}

class IntialScreenInteractor: CategoryBusinessLogic {
    
    weak var presenter : IntialScreenPresenter?
    var dataWorker = DataWorker.init(categoriesAPI: CategoriesAPI())
    
    func fetchCategoryonLaunch(request: Categories.FetchCategories.Request) {
        dataWorker.fetchCategories(request: request) { categories,error in
            
            print(categories)
            print(error)
            
            

        }
    }
}
