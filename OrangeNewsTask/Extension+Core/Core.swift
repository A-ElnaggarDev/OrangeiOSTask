//
//  Core.swift
//  OrangeNewsTask
//
//  Created by maika on 08/02/2022.
//

import Foundation

class Core {
    static let shared = Core()
    
    //MARK: method for selected country
    func setCountry(country code: String) {
        UserDefaults.standard.setValue(code, forKey: "country")
    }
    
    func getCountryCode() -> String? {
        return UserDefaults.standard.string(forKey: "country") ?? ""
    }
    
    
    //MARK: method for selected category
    func setCategory(category code: String) {
        UserDefaults.standard.setValue(code, forKey: "category")
    }
    
    func getCategory() -> String? {
        return UserDefaults.standard.string(forKey: "category") ?? ""
    }
    
//    func isNewUser() -> Bool {
//        return UserDefaults.standard.bool(forKey: "isNewUser")
//    }
//    
//    func setIsNewUser(isNewUser: Bool) {
//        UserDefaults.standard.set(isNewUser, forKey: "isNewUser")
//    }
    
    //MARK: use this function to delete from user defaults
    func deleteObject(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
