//
//  LoginPresenter.swift
//  MovieChallenge
//
//  Created by Yonny on 8/04/24.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {

    weak var loginView: LoginViewProtocol!
    var interactor: LoginInteractorProtocol
    var router: LoginRouterProtocol
    
    init(loginView: LoginViewProtocol) {
        self.loginView = loginView
        self.interactor = LoginInteractor()
        self.router = LoginRouter(loginViewProtocol: loginView)
    }
    
    func validateUser(username: String, password: String) {
        let isValidUser = self.interactor.getUserValidation(userRequest: UserRequest(username: username, password: password))
        
        isValidUser ? loginView.goToMoviesScreen() : loginView.messageErrorPopUp(message: "El usuario o contraseña son incorrectos.")
    }
    
    func validateEmptyFields(username: String?, password: String?) -> Bool {
        guard let usernameString = username, let passwordString = password else {
            return false
        }
        
        return !usernameString.isEmpty && !passwordString.isEmpty ? true : false
    }
    
    func messageErrorPopUp(message: String) {
        self.router.messageErrorPopUp(message: message)
    }
    
    func goToMoviesScreen() {
        self.router.goToMoviesScreen()
    }
}
