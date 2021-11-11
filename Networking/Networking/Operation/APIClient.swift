//
//  APIClient.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation

public class APIClient: APIClientProtocol {
    
    public init() {
        
    }
    
    private enum Constants {
        static let apiKey = "api_key"
        static let language = "language"
        static let key = "c2e78b4a8c14e65dd6e27504e6df95ad"
        static let languageType = "pt-BR"
    }
    
    public func execute<T: Codable>(request: Request, responseType: T.Type, completion: @escaping (Result<T, OperationError>) -> Void) {
        if var urlRequest = makeUrlRequest(request) {
            
            urlRequest.httpMethod = request.method.rawValue
            urlRequest.httpBody = request.body
            urlRequest.allHTTPHeaderFields = request.headers
            debugPrint(urlRequest)
            
            let session = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                do {
                    if let dataResponse = data {
                        let json = try JSONDecoder().decode(responseType.self, from: dataResponse)
                        completion(.success(json))
                    } else {
                        completion(.failure(OperationError.errorGeneric("No data")))
                    }
                } catch {
                    completion(.failure(OperationError.parseError(error.localizedDescription)))
                }
            }
            session.resume()
        } else {
            completion(.failure(OperationError.invalidUrl))
        }
    }
    
    private func makeUrlRequest(_ request: Request) -> URLRequest? {
        guard var urlComponent = URLComponents(string: request.route)
        else { return nil }
        switch request.authorization {
        case .none:
            urlComponent.queryItems = [
                URLQueryItem(name: Constants.language, value: Constants.languageType),
            ]
        case .withApiKey:
            urlComponent.queryItems = [
                URLQueryItem(name: Constants.apiKey, value: Constants.key),
                URLQueryItem(name: Constants.language, value: Constants.languageType),
            ]
        }
        guard let url = urlComponent.url
        else { return nil }
        return URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
    }
}
