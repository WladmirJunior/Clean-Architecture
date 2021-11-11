//
//  RequestError.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import Foundation

public enum OperationError: Error {
    case invalidUrl
    case erro404(String)
    case errorGeneric(String)
    case parseError(String)
    case empty
}
