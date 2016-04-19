//
//  NSAttributedString+UIColor.swift
//  StringKitten
//
//  Created by Carsten Könemann on 19.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Convenience initializers for NSAttributedString

public extension NSAttributedString {

    public convenience init(string: String, color: UIColor) {
        self.init(string: string, attributes: [
            NSForegroundColorAttributeName: color
        ])
    }

}

// MARK: - Builder pattern for NSMutableAttributedString

public extension NSMutableAttributedString {

    public func withColor(color: UIColor) -> NSMutableAttributedString {

        addAttributes([
            NSForegroundColorAttributeName: color
        ], range: NSRange(location: 0, length: string.characters.count))

        return self
    }

}
