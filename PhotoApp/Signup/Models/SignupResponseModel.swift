//
//  SignupResponseModel.swift
//  PhotoApp
//
//  Created by Owais on 2023-07-07.
//

import Foundation

enum ResponseStatus: Int {
    case success = 200
}

struct SignupResponseModel: Codable {
    let status: Int
}
