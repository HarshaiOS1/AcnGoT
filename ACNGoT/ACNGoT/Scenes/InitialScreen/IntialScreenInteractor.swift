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
    
    func fetchCategoryonLaunch(request: Categories.FetchCategories.Request) {
        //call network worker
    }
}
