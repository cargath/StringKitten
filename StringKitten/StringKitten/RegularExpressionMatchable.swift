//
//  RegularExpressionMatchable.swift
//  StringKitten
//
//  Created by Carsten Könemann on 13/04/16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public protocol RegularExpressionMatchable {
    func test(_ input: String, options: NSRegularExpression.MatchingOptions) -> Int?
    func match(_ input: String, options: NSRegularExpression.MatchingOptions) -> [NSTextCheckingResult]?
}

infix operator =~ { associativity left precedence 130 }
public func =~<T: RegularExpressionMatchable> (left: T, right: String) -> Int? {
    return left.test(right, options: [])
}
