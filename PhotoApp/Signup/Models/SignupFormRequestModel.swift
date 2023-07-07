//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Owais on 2023-07-07.
//

import Foundation

struct SignupFormRequestModel: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
}
