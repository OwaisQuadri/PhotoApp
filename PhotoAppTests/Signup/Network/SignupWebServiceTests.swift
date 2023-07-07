//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Owais on 2023-07-07.
//

import XCTest

final class SignupWebServiceTests: XCTestCase {
    var sut: SignupWebService!
    var form: SignupFormRequestModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let urlSessionConfig = URLSessionConfiguration.ephemeral // doesnt use persistent storage / caching
        urlSessionConfig.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: urlSessionConfig)
        sut = SignupWebService(urlString: "https://bit.ly/signup-mock-service-users", urlSession: urlSession)
        form = SignupFormRequestModel(firstName: "Owais", lastName: "Quadri", email: "owais@email.com", password: "Owais-123")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        form = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func testSignupWebService_GivenSuccessResponse_ReturnSuccess() {
        // Arrange
        let jsonString = #"{"status" : 200 }"#
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8) // static stub
        let expectation = self.expectation(description: "Sign up success provides success response")
        // Act
        sut.register(with: form) { (response,error) in
            // Assert
            XCTAssertEqual(response?.status, ResponseStatus.success.rawValue )
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_ReceiveUnknownJSON_ReturnErr() {
        // Arrange
        let jsonString = #"{"stats" : 200 }"#
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8) // static stub
        let expectation = self.expectation(description: "Sign up with an invalid JSON in response will give error")
        // Act
        sut.register(with: form) { (response,err) in
            // Assert
            XCTAssertNil(response, "the response should be nil, and error should exist" )
            XCTAssertEqual(err, SignupError.invalidJSON, "error should be \".invalidJSON\"")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
}
