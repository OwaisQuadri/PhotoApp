//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Owais on 2023-07-07.
//

import XCTest

final class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testSignupWebService_GivenSuccessResponse_ReturnSuccess() {
        // Arrange
        let sut = SignupWebService(urlString: "https://bit.ly/signup-mock-service-users")
        let expectation = self.expectation(description: "Sign up response")
        // Act
        let form = SignupFormRequestModel(firstName: "Owais", lastName: "Quadri", email: "owais@email.com", password: "Owais-123")
        sut.register(with: form) { (response,error) in
            // Assert
            XCTAssertEqual(response?.status, 200 )
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
}
