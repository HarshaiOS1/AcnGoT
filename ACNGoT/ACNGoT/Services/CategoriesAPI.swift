//
//  CategoriesAPI.swift
//  ACNGoT
//
//  Created by Harsha on 11/09/2022.
//

import Foundation

class CategoriesAPI: CategoryDataProtocol, CategoryListDetailProtocol {
    func fetchCategoyListDetails(request: URLRequest, completionHandler: @escaping (Any?, Error?) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            let decodableTypes : [Decodable.Type] = [Books.self,Charectors.self,Houses.self]
            if error != nil {
                completionHandler(nil,error)
                return
            } else {
                if (Constants.positiveStatusCodes.contains((response as? HTTPURLResponse)?.statusCode ?? 400)) {
                    guard let _data = data else {
                        completionHandler(nil,"Error with request" as? Error)
                        return
                    }
                    let details = JSONDecoder().decode(possibleTypes: decodableTypes.self, from: _data)
                    completionHandler(details,nil)
                    
                } else {
                    completionHandler(nil,"Error \(String(describing: (response as? HTTPURLResponse)))" as? Error)
                }
            }
        }.resume()
    }
    
    func fetchCategories(request: Categories.FetchCategories.Request, completionHandler: @escaping ([Category]?, Error?) -> Void) {
        if let request = request.getRequest() {
            URLSession.shared.dataTask(with: request) { data, response, error in
                if error != nil {
                    completionHandler(nil,error)
                    return
                } else {
                    if (Constants.positiveStatusCodes.contains((response as? HTTPURLResponse)?.statusCode ?? 400)) {
                        
                        guard let _data = data else {
                            completionHandler(nil,"Error with request" as? Error)
                            return
                        }
                        do {
                            let categories = try JSONDecoder().decode(Categories.FetchCategories.Response.self, from: _data)
                            UserDefaults.standard.set(_data, forKey: Constants.userdefaultKeys.categories.rawValue)
                            completionHandler(categories,nil)
                        } catch  {
                            completionHandler(nil,"error decoding data" as? Error)
                        }
                    } else {
                        completionHandler(nil,"Error \(String(describing: (response as? HTTPURLResponse)))" as? Error)
                    }
                }
            }.resume()
        } else {
            completionHandler(nil,"Error with request" as? Error)
        }
    }
}
