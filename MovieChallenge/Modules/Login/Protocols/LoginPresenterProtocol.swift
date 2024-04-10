//
//  LoginPresenterProtocol.swift
//  MovieChallenge
//
//  Created by Yonny on 8/04/24.
//

import Foundation

protocol LoginPresenterProtocol {
    
    func validateUser(username: String, password: String)
    func validateEmptyFields(username: String?, password: String?) -> Bool
    func messageErrorPopUp(message: String)
    func goToMoviesScreen()
}
