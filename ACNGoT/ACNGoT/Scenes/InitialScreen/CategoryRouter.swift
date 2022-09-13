//
//  CategoryRouter.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation
import UIKit

protocol RouterLogic {
    func navigateToCatagory(routeType: Int)
}

enum RouteFromCatagory: String {
    case books = "Books"
    case houses = "Houses"
    case characters = "Characters"
}

class CategoryRouter: UINavigationController, RouterLogic {
    weak var viewcontroller : InitalViewController?
    func navigateToCatagory(routeType: Int) {
        if let vc = Storyboards.mainStoryboard.instantiateViewController(withIdentifier: "CategoryListViewController") as? CategoryListViewController {
            vc.categoryType = routeType
            self.viewcontroller?.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

struct Storyboards {
    static let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
}
