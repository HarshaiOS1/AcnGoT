//
//  IntialScreenPresenter.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation
import UIKit

protocol IntialScreenPresentationLogic {
    func presentFetchedOrders(response: Categories.FetchCategories.Response)
}

class IntialScreenPresenter {
    weak var viewcontroller : InitalDisplayLogic?
}
