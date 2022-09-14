//
//  CategoryListViewController.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation
import UIKit

protocol CategoryListLogic: AnyObject {
    func loadListDetails(details: Any)
}

class CategoryListViewController: UIViewController,CategoryListLogic {
    var categoryType: Int?
    
    var bookDeatils: Books?
    var charectors: Charectors?
    var houses: Houses?
    
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
        getDetails()
    }
    
    func loadListDetails(details: Any) {
        if let cat = categoryType {
            switch cat {
                case CatagoryType.books.rawValue:
                    self.title = "Books"
                    self.bookDeatils = details as? Books
                case CatagoryType.houses.rawValue:
                    self.title = "Houses"
                    self.houses = details as? Houses
                case CatagoryType.charectors.rawValue:
                    self.title = "Charectors"
                    self.charectors = details as? Charectors
                default:
                    break
            }
         updateTableViewData()
        }
    }
    
    func updateTableViewData() {
        let tableview = UITableView.init(frame: self.view.frame)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib.init(nibName: "ListDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "ListDetailTableViewCell")
        self.view.addSubview(tableview)
    }
    
    func getDetails() {
        if let _categoryType = categoryType,
           let request = CategoryList.ListDetails.Request.getRequest(catType: _categoryType){
            interactor?.fetchCategoryListDetails(request: request)
        }
    }
}

//MARK: UITableViewDelegate & UITableViewDataSource
extension CategoryListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookDeatils?.count ?? houses?.count ?? charectors?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ListDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListDetailTableViewCell", for: indexPath) as? ListDetailTableViewCell else {
            return UITableViewCell.init(frame: CGRect.init(x: 0.0, y: 0.0, width: tableView.frame.width, height: 100.0))
        }
    //Need rafactoring here
        if let books = bookDeatils {
            cell.titleLabel.text = books[indexPath.row].name
            cell.descriptionLabel.text = "authors: \(String(describing: books[indexPath.row].authors.first)), publisher: \(books[indexPath.row].publisher) , country: \(books[indexPath.row].country)"
            cell.houseImageView.isHidden = true
        } else if let charectors = charectors {
            cell.titleLabel.text = "name: \(charectors[indexPath.row].name) played by: \(String(describing: charectors[indexPath.row].playedBy.first))"
            cell.descriptionLabel.text = charectors[indexPath.row].titles.first
            cell.houseImageView.isHidden = true
        } else if let houses = houses {
            cell.updateUI(title: houses[indexPath.row].name, subtitle: houses[indexPath.row].title, house: houses[indexPath.row].region)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
    }
}
