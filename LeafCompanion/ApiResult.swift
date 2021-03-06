//
//  ApiResult.swift
//  LeafCompanion
//
//  Created by Matthew Mohrman on 5/11/18.
//  Copyright © 2018 Matthew Mohrman. All rights reserved.
//

import Foundation

enum ApiResult<Value> {
    case Success(value: Value)
    case Failure(error: Error)
    
    init(_ f: () throws -> Value) {
        do {
            let value = try f()
            self = .Success(value: value)
        } catch let error {
            self = .Failure(error: error)
        }
    }
    
    func unwrap() throws -> Value {
        switch self {
        case .Success(let value):
            return value
        case .Failure(let error):
            throw error
        }
    }
}
