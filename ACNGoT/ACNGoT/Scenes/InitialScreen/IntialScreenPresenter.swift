//
//  IntialScreenPresenter.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation
import UIKit

protocol IntialScreenPresentationLogic {
    func presentFetchedCategory(response: Categories.FetchCategories.Response, error: Error?)
}

class IntialScreenPresenter: IntialScreenPresentationLogic {
    weak var viewcontroller : InitalDisplayLogic?
    func presentFetchedCategory(response: Categories.FetchCategories.Response, error: Error?) {
        viewcontroller?.displayCategories(viewModel: Categories.FetchCategories.ViewModel.init(categories: response),error: error)
    }
}
