//
//  Request.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum AuthorizationType {
    case withApiKey
    case none
}

public protocol Request {
    var route: String { get }
    var method: HttpMethod { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
    var authorization: AuthorizationType { get }
}
