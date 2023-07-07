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
        guard let url = url else {
            completion(nil, SignupError.invalidURLString)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(form)
        
        urlSession.dataTask(with: request) { (data, response, err) in
            if let _ = err {
                completion(nil, SignupError.failedRequest(desc: Localized.failedRequestErrorDescription))
                return
            }
            if let data = data, let response = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completion(response, nil)
            } else {
                completion(nil, SignupError.invalidJSON)
            }
        }.resume()
        
    }
}
class Localized {
    static let failedRequestErrorDescription = NSLocalizedString("SignupError_failedRequest_description", value: "error description for SignupError.failedRequest", comment: "error description for SignupError.failedRequest")
}
