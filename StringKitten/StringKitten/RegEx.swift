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
    public var options: NSRegularExpressionOptions = []

    public var expression: NSRegularExpression? {
        return try? NSRegularExpression(pattern: self.pattern, options: options)
    }

}

// MARK: - RegularExpressionMatchable

extension RegEx: RegularExpressionMatchable {

    public func test(input: String, options: NSMatchingOptions = []) -> Int? {

        if let
            expression = self.expression,
            firstMatch = expression.matchesInString(input, options: options, range: NSMakeRange(0, input.characters.count)).first {

                return firstMatch.range.location
        }

        return nil
    }

    public func match(input: String, options: NSMatchingOptions = []) -> [NSTextCheckingResult]? {

        if let expression = self.expression {
            return expression.matchesInString(input, options: options, range: NSMakeRange(0, input.characters.count))
        }

        return nil
    }

}

// MARK: - StringLiteralConvertible

extension RegEx: StringLiteralConvertible {

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
