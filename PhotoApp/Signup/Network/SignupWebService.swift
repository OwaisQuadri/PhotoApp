//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Owais on 2023-07-07.
//

import Foundation

class SignupWebService {
    private var urlSession: URLSession
    private var url: URL?
    init(urlString: String, urlSession: URLSession = .shared) {
        url = URL(string: urlString)
        self.urlSession = urlSession
    }
    func register(with form: SignupFormRequestModel, completion: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        guard let url = url else { return } // TODO: create unit test for invalid URL and throw an error
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(form)
        
        urlSession.dataTask(with: request) { (data, response, err) in
            //
        }.resume()
        
    }
}