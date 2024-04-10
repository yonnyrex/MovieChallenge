//
//  LoginInteractor.swift
//  MovieChallenge
//
//  Created by Yonny on 8/04/24.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    func getUserValidation(userRequest: UserRequest) -> Bool {
         
        let userData = User()
        
        return userRequest.username != userData.email ? false :
        userRequest.password != userData.password ? false : true
    }
}
