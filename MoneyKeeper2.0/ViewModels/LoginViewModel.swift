//
//  LoginViewModel.swift
//  MoneyKeeper2.0
//
//  Created by Станислав Никишков on 19.09.2020.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    private var usernameRequested: String? = "admin"
    private var passwordRequested: String? = "admin"
    
    
    func loginButtonTapped(username: String?, password: String?) -> Bool {
        guard checkForValid(username: username, password: password) else {
            return false
        }
        return true
    }
    
    private func checkForValid(username: String?, password: String?) -> Bool {
        guard let username = username, let password = password else {
            return false
        }
        guard username == usernameRequested, password == passwordRequested else {
            return false
        }
        return true
    }
}
