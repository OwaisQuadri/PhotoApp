//
//  SignupFormValidator.swift
//  PhotoApp
//
//  Created by Owais on 2023-07-06.
//

import Foundation

class SignupFormValidator {
    
    func validate(firstName: String) -> Bool {
        var isValid = true
        if firstName.count < 2 || firstName.count > 20 {
            isValid = false
        }
        return isValid
    }
    
    func validate(email: String) -> Bool {
        var isValid = true
        if !email.contains("@") || !email.contains(".") {
            isValid = false
        }
        return isValid
    }
    
    func checkIfPasswordsMatch(password: String, confirmPassword: String) -> Bool {
        if password.isEmpty { return false } else { return password == confirmPassword }
    }
}
