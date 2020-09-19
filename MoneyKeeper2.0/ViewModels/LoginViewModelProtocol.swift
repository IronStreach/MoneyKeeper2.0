//
//  LoginViewModelProtocol.swift
//  MoneyKeeper2.0
//
//  Created by Станислав Никишков on 19.09.2020.
//

import Foundation

protocol LoginViewModelProtocol {
    func loginButtonTapped(username: String?, password: String?) -> Bool
}
