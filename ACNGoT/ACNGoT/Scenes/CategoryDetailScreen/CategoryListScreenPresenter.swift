//
//  CategoryListScreenPresenter.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation
protocol CategoryListPresentationLogic {
    func presentFetchedListDetails(details: Any)
}

class CategoryListScreenPresenter: CategoryListPresentationLogic {
    weak var vc: CategoryListLogic?
    func presentFetchedListDetails(details: Any) {
        DispatchQueue.main.async {
            self.vc?.loadListDetails(details: details)
        }
    }
}
