//
//  LoginRouter.swift
//  MovieChallenge
//
//  Created by Yonny on 8/04/24.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    
    
    private weak var loginViewProtocol: LoginViewProtocol!
    
    init(loginViewProtocol: LoginViewProtocol) {
        self.loginViewProtocol = loginViewProtocol
    }
    
    func goToMoviesScreen() {
        
    }
    
    func messageErrorPopUp(message: String) {
        
        let alertVC = LoginAssembly.build(title: "MovieChallege", message: message)
        let originVC = self.loginViewProtocol as! LoginViewController
        originVC.present(alertVC, animated: true, completion: nil)
    }
}

class LoginAssembly {
    
    static func build(title: String, message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
}
