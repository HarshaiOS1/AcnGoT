//
//  InitalViewController.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation
import UIKit
import Lottie

protocol InitalDisplayLogic: AnyObject {
    func displayCategories(viewModel: Categories.FetchCategories.ViewModel, error: Error?)
}

class InitalViewController: UIViewController, InitalDisplayLogic {
    var interactor: CategoryBusinessLogic?
    var router: RouterLogic?
    var lottieAnimationView: AnimationView?
    var categoryList: [Category]?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        
        let interactor = IntialScreenInteractor()
        let presenter = IntialScreenPresenter()
        let router = CategoryRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewcontroller = viewController
        interactor.presenter = presenter
        router.viewcontroller = viewController
    }
    
    func displayCategories(viewModel: Categories.FetchCategories.ViewModel, error: Error?) {
        if (error == nil) {
            categoryList = viewModel.categories
            categoryList = categoryList?.sorted{$0.categoryName < $1.categoryName}
            DispatchQueue.main.async {
                self.lottieAnimationView?.removeFromSuperview()
                self.showListOfCategories()
            }
        } else {
            //show error
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        self.navigationItem.largeTitleDisplayMode = .always
        addLaunchAnimationView()
    }
        
    func addLaunchAnimationView() {
        if let  path = Bundle.main.path(forResource: "castle-dragon-palace", ofType: "json") {
            lottieAnimationView = AnimationView(filePath: path)
        }
        lottieAnimationView?.frame = self.view.frame
        lottieAnimationView?.loopMode = .playOnce
        lottieAnimationView?.animationSpeed = 5.0
        lottieAnimationView?.play(completion: { isdone in
            self.getCategories()
        })
        
        if let animi = lottieAnimationView {
            self.view.addSubview(animi)
        }
    }
    
    func showListOfCategories() {
        let tableview = UITableView.init(frame: self.view.frame)
        tableview.delegate = self
        tableview.dataSource = self
        self.view.addSubview(tableview)
    }
    
    func getCategories() {
        let request = Categories.FetchCategories.Request()
        interactor?.fetchCategoryonLaunch(request: request)
    }
}

//MARK: UITableViewDelegate & UITableViewDataSource
extension InitalViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(frame: CGRect.init(x: 0.0, y: 0.0, width: tableView.frame.width, height: 100))
        cell.layer.borderColor = UIColor.black.cgColor
        let title = UILabel.init(frame: cell.frame)
        title.text = categoryList?[indexPath.row].categoryName
        title.textAlignment = .center
        cell.contentView.addSubview(title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.navigateToCatagory(routeType: ((categoryList?[indexPath.row].type ?? 0) + 1))
        
    }
}
