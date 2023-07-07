//
//  SignupFormValidatorTests.swift
//  PhotoAppTests
//
//  Created by Owais on 2023-07-06.
//

import XCTest

final class SignupFormValidatorTests: XCTestCase {

    var sut: SignupFormValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // setup sut
        sut = SignupFormValidator() // system under test
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        // cleanup sut
        sut = nil
    }

    func testSignupFormValidator_WhenFirstNameIsValid_ShouldReturnTrue() {
        // Arrange / Given
        let validFirstName = "Owais"
        // Act
        let isFirstNameValid = sut.validate(firstName: validFirstName)
        //Assert / Then
        XCTAssertTrue(isFirstNameValid, "First name \"\(validFirstName)\" is  returning \(isFirstNameValid) for the validate function when it should return \(!isFirstNameValid)")
    }
    
    func testSignupFormValidator_WhenFirstNameIsEmpty_ShouldReturnFalse() {
        // Arrange / Given
        let emptyFirstName = ""
        // Act
        let isFirstNameValid = sut.validate(firstName: emptyFirstName)
        //Assert / Then
        XCTAssertFalse(isFirstNameValid, "First name \"\(emptyFirstName)\" is  returning \(isFirstNameValid) for the validate function when it should return \(!isFirstNameValid)")
    }
    
    func testSignupFormValidator_WhenFirstNameIsTooShort_ShouldReturnFalse() {
        // Arrange / Given
        let shortFirstName = "s"
        // Act
        let isFirstNameValid = sut.validate(firstName: shortFirstName)
        //Assert / Then
        XCTAssertFalse(isFirstNameValid, "First name \"\(shortFirstName)\" is  returning \(isFirstNameValid) for the validate function when it should return \(!isFirstNameValid)")
    }
    
    func testSignupFormValidator_WhenFirstNameExceeds20Characters_ShouldReturnFalse() {
        // Arrange
        let longFirstName = "FirstNameThatExceeds20Characters"
        // Act
        let isFirstNameValid = sut.validate(firstName: longFirstName)
        // Assert
        XCTAssertFalse(isFirstNameValid, "First name \"\(longFirstName)\" is  returning \(isFirstNameValid) for the validate function when it should return \(!isFirstNameValid)")
    }
    
    func testSignupFormValidator_WhenEmailIsValid_ShouldReturnTrue() {
        // Arrange
        let validEmail = "valid@email.com"
        // Act
        let isEmailValid = sut.validate(email: validEmail)
        // Assert
        XCTAssertTrue(isEmailValid, "Email \"\(validEmail)\" is  returning false for the validate function when it should return true")
    }
    
    func testSignupFormValidator_WhenEmailIsMissingAtSymbol_ShouldReturnFalse() {
        // Arrange
        let noAtEmail = "validemail.com"
        // Act
        let isEmailValid = sut.validate(email: noAtEmail)
        // Assert
        XCTAssertTrue(!isEmailValid, "Email \"\(noAtEmail)\" is  returning \(isEmailValid) for the validate function when it should return \(!isEmailValid)")
    }
    
    func testSignupFormValidator_WhenEmailIsMissingPeriodSymbol_ShouldReturnFalse() {
        // Arrange
        let noPeriodEmail = "valid@emailcom"
        // Act
        let isEmailValid = sut.validate(email: noPeriodEmail)
        // Assert
        XCTAssertTrue(!isEmailValid, "Email \"\(noPeriodEmail)\" is  returning \(isEmailValid) for the validate function when it should return \(!isEmailValid)")
    }
    
    func testSignupFormValidator_WhenPasswordsMatch_ShouldReturnTrue() {
        // Arrange
        let password = "Owais-123"
        let confirmPassword = "Owais-123"
        // Act
        let doPasswordsMatch: Bool = sut.checkIfPasswordsMatch(password: password, confirmPassword: confirmPassword)
        // Assert
        XCTAssertTrue(doPasswordsMatch, "passwords (\"\(password)\", \"\(confirmPassword)\") are  returning \(doPasswordsMatch) for the validate function when it should return \(!doPasswordsMatch)")
    }
    
    func testSignupFormValidator_WhenPasswordsDontMatch_ShouldReturnFalse() {
        // Arrange
        let password = "Owais-123"
        let confirmPassword = "Owais-1234"
        // Act
        let doPasswordsMatch: Bool = sut.checkIfPasswordsMatch(password: password, confirmPassword: confirmPassword)
        // Assert
        XCTAssertTrue(!doPasswordsMatch, "passwords (\"\(password)\", \"\(confirmPassword)\") are  returning \(doPasswordsMatch) for the validate function when it should return \(!doPasswordsMatch)")
    }
    
    func testSignupFormValidator_WhenPasswordsAreEmpty_ShouldReturnFalse() {
        // Arrange
        let password = ""
        let confirmPassword = ""
        // Act
        let doPasswordsMatch: Bool = sut.checkIfPasswordsMatch(password: password, confirmPassword: confirmPassword)
        // Assert
        XCTAssertTrue(!doPasswordsMatch, "passwords (\"\(password)\", \"\(confirmPassword)\") are  returning \(doPasswordsMatch) for the validate function when it should return \(!doPasswordsMatch)")
    }
}
