//
//  String+NSString.swift
//  StringKitten
//
//  Created by Carsten Könemann on 23.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public extension String {

    public var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }

    public func stringByReplacingCharactersInRange(range: NSRange, withString replacement: String) -> String {
        return (self as NSString).stringByReplacingCharactersInRange(range, withString: replacement)
    }

}
