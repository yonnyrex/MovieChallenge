//
//  LoginConfigurator.swift
//  MovieChallenge
//
//  Created by Yonny on 10/04/24.
//

import Foundation

class LoginConfigurator: LoginConfiguratorProtocol {
    
    func configure(viewController: LoginViewController) {
        viewController.loginPresenter = LoginPresenter(loginView: viewController)
    }
}
