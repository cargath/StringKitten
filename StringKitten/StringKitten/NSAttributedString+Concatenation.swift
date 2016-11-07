//
//  NSAttributedString+Concatenation.swift
//  StringKitten
//
//  Created by Carsten Könemann on 20.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

// MARK: - Helpers to concatenate NSAttributedStrings

public extension NSAttributedString {

    public class func flatten(_ attributedStrings: [NSAttributedString]) -> NSAttributedString {

        let combined = NSMutableAttributedString()

        for attributedString in attributedStrings {
            combined.append(attributedString)
        }

        return combined.copy() as! NSAttributedString
    }

    public func attributedStringByAppendingAttributedString(_ attributedString: NSAttributedString) -> NSAttributedString {

        let combined = NSMutableAttributedString()

        combined.append(self)
        combined.append(attributedString)

        return combined.copy() as! NSAttributedString
    }

}

// MARK: - Convenience functions for convenience functions

public extension Array where Element: NSAttributedString {

    public var flattened: NSAttributedString {
        return NSAttributedString.flatten(self)
    }

}

public func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
    return lhs.attributedStringByAppendingAttributedString(rhs)
}
