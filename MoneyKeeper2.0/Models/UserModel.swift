//
//  UserModel.swift
//  MoneyKeeper2.0
//
//  Created by Станислав Никишков on 19.09.2020.
//

import Foundation

class User {
    private let username: String
    private let password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func getUsername() -> String {
        return self.username
    }
    
    func getPassword() -> String {
        return self.password
    }
}
