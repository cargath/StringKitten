//
//  RegEx.swift
//  StringKitten
//
//  Created by Carsten Könemann on 13/04/16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

// MARK: - RegEx

public struct RegEx {

    public var pattern: String = ""
    public var options: NSRegularExpression.Options = []

    public var expression: NSRegularExpression? {
        return try? NSRegularExpression(pattern: self.pattern, options: options)
    }

}

// MARK: - RegularExpressionMatchable

extension RegEx: RegularExpressionMatchable {

    public func test(_ input: String, options: NSRegularExpression.MatchingOptions = []) -> Int? {

        if let
            expression = self.expression,
            let firstMatch = expression.matches(in: input, options: options, range: NSMakeRange(0, input.characters.count)).first {

                return firstMatch.range.location
        }

        return nil
    }

    public func match(_ input: String, options: NSRegularExpression.MatchingOptions = []) -> [NSTextCheckingResult]? {

        if let expression = self.expression {
            return expression.matches(in: input, options: options, range: NSMakeRange(0, input.characters.count))
        }

        return nil
    }

}

// MARK: - StringLiteralConvertible

extension RegEx: ExpressibleByStringLiteral {

    public typealias ExtendedGraphemeClusterLiteralType = String
    public typealias UnicodeScalarLiteralType = String

    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.pattern = value
    }

    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.pattern = "\(value)"
    }

    public init(stringLiteral value: StringLiteralType) {
        self.pattern = value
    }
    
    init(_ value: StringLiteralType) {
        self.pattern = value
    }
    
}
