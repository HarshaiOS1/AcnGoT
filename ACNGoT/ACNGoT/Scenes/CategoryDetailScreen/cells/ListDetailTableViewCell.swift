//
//  ListDetailTableViewCell.swift
//  ACNGoT
//
//  Created by Harsha on 13/09/2022.
//

import Foundation
import UIKit

class ListDetailTableViewCell : UITableViewCell {
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func updateUI(title: String, subtitle: String, house: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = subtitle
        var imageUrl = ""
        switch house {
            case HouseImage.theVale.rawValue:
                imageUrl = HouseImage.theVale.imageUrl ?? ""
            case HouseImage.theNorth.rawValue:
                imageUrl = HouseImage.theNorth.imageUrl ?? ""
            case HouseImage.theReach.rawValue:
                imageUrl = HouseImage.theReach.imageUrl ?? ""
            case HouseImage.drone.rawValue:
                imageUrl = HouseImage.drone.imageUrl ?? ""
            case HouseImage.riverlands.rawValue:
                imageUrl = HouseImage.riverlands.imageUrl ?? ""
            case HouseImage.ironIslands.rawValue:
                imageUrl = HouseImage.ironIslands.imageUrl ?? ""
            case HouseImage.westerlands.rawValue:
                imageUrl = HouseImage.westerlands.imageUrl ?? ""
            case HouseImage.stormlands.rawValue:
                imageUrl = HouseImage.stormlands.imageUrl ?? ""
            default:
                break
        }
        if let url = URL(string: imageUrl) {
            if let data = try? Data(contentsOf: url) {
                houseImageView.image = UIImage(data: data)
            }
            
        }
    }
}
