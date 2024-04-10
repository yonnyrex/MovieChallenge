//
//  LoginViewProtocol.swift
//  MovieChallenge
//
//  Created by Yonny on 8/04/24.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    func goToMoviesScreen()
    func messageErrorPopUp(message: String)
}
