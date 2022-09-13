//
//  CategoryListViewController.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation
import UIKit

protocol CategoryListLogic: AnyObject {
    func loadListDetails()
}

class CategoryListViewController: UIViewController,CategoryListLogic {
    var categoryType: Int?
    var interactor: CategoryListBusinessLogic?
    var presenter: CategoryListScreenPresenter?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let vc = self
        
        let interactor = CategoryListScreenInteractor()
        let presenter = CategoryListScreenPresenter()
        
        vc.interactor = interactor
        interactor.presenter = presenter
        presenter.vc = vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadListDetails()
    }
    
    func loadListDetails() {
        if let _categoryType = categoryType,
           let request = CategoryList.ListDetails.Request.getRequest(catType: _categoryType){
            interactor?.fetchCategoryListDetails(request: request)
        }
    }
}
