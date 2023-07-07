//
//  SignupError.swift
//  PhotoApp
//
//  Created by Owais on 2023-07-07.
//

import Foundation

enum SignupError: Error, Equatable {
    case invalidJSON
    case invalidURLString
    case failedRequest(desc: String)
}
