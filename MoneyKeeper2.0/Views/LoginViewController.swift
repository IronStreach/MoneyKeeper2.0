//
//  LoginView.swift
//  MoneyKeeper2.0
//
//  Created by Станислав Никишков on 18.09.2020.
//
import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    private let viewModel: LoginViewModelProtocol = LoginViewModel()
    let usernameTF: UITextField! = UITextField()
    let passwordTF: UITextField! = UITextField()
    let stack: UIStackView! = UIStackView()
    let loginButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stack.addArrangedSubview(usernameTF)
        stack.addArrangedSubview(passwordTF)
        stack.spacing = 10
        stack.axis = .vertical
        
        view.addSubview(stack)
        view.addSubview(loginButton)
        
        setStackConstraints(for: stack)
        setTFConstraints(for: usernameTF)
        setTFConstraints(for: passwordTF)
        setButtonConstraints(for: loginButton, topElement: stack)
        
        setupTF(usernameTF)
        setupTF(passwordTF)
        setupButton(loginButton)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        
        usernameTF.placeholder = "Username"
        passwordTF.placeholder = "Password"
    }
    
    func setStackConstraints(for stack: UIStackView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.heightAnchor.constraint(equalToConstant: 110).isActive = true
        stack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -120).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    func setTFConstraints(for tf: UITextField) {
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func setupTF(_ tf: UITextField) {
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = CGFloat(2)
        tf.layer.cornerRadius = CGFloat(22)
        tf.layer.cornerCurve = CALayerCornerCurve.continuous
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: tf.frame.height))
        tf.leftViewMode = .always
        
        if tf == passwordTF {
            tf.isSecureTextEntry = true
        }
    }
    
    func setButtonConstraints(for button: UIButton, topElement: UIView?) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        guard let topElement = topElement else {
            return
        }
        button.topAnchor.constraint(equalTo: topElement.bottomAnchor, constant: 40).isActive = true
        button.widthAnchor.constraint(equalTo: topElement.widthAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
}
    
    func setupButton(_ button: UIButton) {
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = CGFloat(2)
        button.layer.cornerRadius = CGFloat(22)
        button.layer.cornerCurve = CALayerCornerCurve.continuous
    }

}

extension LoginViewController {
    @objc func login() {
        guard viewModel.loginButtonTapped(username: usernameTF.text, password: passwordTF.text) else {
            let ac = UIAlertController(title: "Failed", message: "Enter the valid username or password", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(ac, animated: true)
            return
        }
        loginButton.backgroundColor = .lightGray
        loginButton.isEnabled = false
        
        
    }
}
