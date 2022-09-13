//
//  Utils.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation

class Constants {
    static let positiveStatusCodes = [200,201,202,203,204]
    static let baseurl =  "https://private-anon-81757c5574-androidtestmobgen.apiary-mock.com"
    static let getCategories = "/categories"
    static let getListDetail = "/list/%lu"
    
    enum userdefaultKeys: String {
        case categories = "kcategories"
    }    
}

enum CatagoryType : Int{
    case books = 1
    case houses = 2
    case charectors = 3
}


enum HouseImage :String, CaseIterable {
    case theNorth = "The North"
    case theVale = "The Vale"
    case theReach = "The Reach"
    case drone = "Dorne"
    case riverlands = "The Riverlands"
    case ironIslands = "Iron Islands"
    case westerlands = "TheWesterlands"
    case stormlands = "Stormlands"
}

extension HouseImage {
    var imageUrl: String? {
        switch self {
            case .theNorth:
                return "https://bit.ly/2Gcq0r4"
            case .theVale:
                return "https://bit.ly/34FAvws"
            case .theReach:
                return "https://bit.ly/2HSCW5N"
            case .riverlands:
                return "https://bit.ly/3kJrIiP"
            case .westerlands:
                return "https://bit.ly/2TAzjnO"
            case .stormlands:
                return "https://bit.ly/34F2sEC"
            case .drone:
                return "https://bit.ly/2HOcavT"
            case .ironIslands:
                return "https://bit.ly/3kJrIiP"
        }
    }
}
