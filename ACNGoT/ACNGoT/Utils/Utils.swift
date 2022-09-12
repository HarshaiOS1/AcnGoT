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
    static let list = "/list/%@"
    
    enum userdefaultKeys: String {
        case categories = "kcategories"
    }
    
}
