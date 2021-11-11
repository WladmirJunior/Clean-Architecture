//
//  APIClientProtocol.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation

public protocol APIClientProtocol {
    func execute<T: Codable>(request: Request, responseType: T.Type, completion: @escaping (Result<T, OperationError>) -> Void)
}
