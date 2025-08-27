//
//  ViewController.swift
//  Bankey
//
//  Created by Yashwant Sheshkar on 09/08/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var passward: String? {
        return loginView.passwardTextField.text
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}



extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0 // this is what gives the label to jump ( wrap around ) of the next line if the text is going out of bounds.
        errorMessageLabel.isHidden = true
        
        
        
        
    }
    
    
    
    private func layout() {
        
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //MARK: - Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1), //multiplier 1 means 8pt
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1), //here the language is flipped because view traling anchor comes after to that of loginViews trailing anchor
            ])
        
        //MARK: - signInButton
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //MARK: - Error Message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor
                                                       )
        ])
        
    }
    
}


//MARK: - Actions

extension LoginViewController {
    @objc func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let passward = passward else {
            assertionFailure("Username / Passward, should never be nil")
            return
        }
        
        if username.isEmpty || passward.isEmpty {
            configureView(withMessage: "Username / Passward is empty")
            return
        }
        
        if username == "Kevin" && passward == "welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / passward")
        }
        
        func configureView(withMessage message: String) {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = message
            
        }
    }
}



