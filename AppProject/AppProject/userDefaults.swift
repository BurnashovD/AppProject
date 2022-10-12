//
//  userDefaults.swift
//  AppProject
//
//  Created by Daniil on 12.10.2022.
//

import Foundation

class userDef {
    
    static var shared = userDef()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    func saveData(key: String) -> String {
        defaults.value(forKey: key) as? String ?? ""
    }
    
    func sendData(param: String, key: String) {
        defaults.set(param, forKey: key)
    }
}
