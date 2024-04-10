//
//  LoginInteractorProtocol.swift
//  MovieChallenge
//
//  Created by Yonny on 8/04/24.
//

import Foundation

protocol LoginInteractorProtocol {
    func getUserValidation(userRequest: UserRequest) -> Bool
}
