//
//  LoginViewController.swift
//  MovieChallenge
//
//  Created by Yonny on 8/04/24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: RoundedButton!
    
    var loginPresenter: LoginPresenterProtocol?
    var loginConfigurator: LoginConfiguratorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginConfigurator = LoginConfigurator()
        loginConfigurator?.configure(viewController: self)
    }
    
    @IBAction func goToMoviesScreen(_ sender: Any) {
        self.loginPresenter?.validateUser(username: userTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}


extension LoginViewController: LoginViewProtocol {
    func goToMoviesScreen() {
        self.loginPresenter?.goToMoviesScreen()
    }
    
    func messageErrorPopUp(message: String) {
        self.loginPresenter?.messageErrorPopUp(message: message)
    }
}
