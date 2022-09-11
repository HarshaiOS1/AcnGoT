//
//  InitalViewController.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation
import UIKit
import Lottie

protocol InitalDisplayLogic: AnyObject
{
    func displayCategories(viewModel: Categories.FetchCategories.ViewModel)
}

class InitalViewController: UIViewController, InitalDisplayLogic {
    var interactor: CategoryBusinessLogic?
    
    private func setup() {
        let interactor = IntialScreenInteractor()
        let presenter = IntialScreenPresenter()
//        let router = ListOrdersRouter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewcontroller = self
        
    }
    
    func displayCategories(viewModel: Categories.FetchCategories.ViewModel) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        var lottieAnimationView = AnimationView.init()
        if let  path = Bundle.main.path(forResource: "castle-dragon-palace", ofType: "json") {
            lottieAnimationView = AnimationView(filePath: path)
        }
        lottieAnimationView.frame = self.view.frame
        lottieAnimationView.loopMode = .playOnce
//        lottieAnimationView.play()
        lottieAnimationView.animationSpeed = 2.0
        lottieAnimationView.play { idDone in
            self.getCategories()
        }
        self.view.addSubview(lottieAnimationView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func getCategories() {
        let request = Categories.FetchCategories.Request()
        interactor?.fetchCategoryonLaunch(request: request)
    }
    
}
