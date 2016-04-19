//
//  NSAttributedString+UIFont.swift
//  StringKitten
//
//  Created by Carsten Könemann on 19.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Convenience initializers for NSAttributedString

public extension NSAttributedString {

    public convenience init(string: String, font: UIFont) {
        self.init(string: string, attributes: [
            NSFontAttributeName: font
        ])
    }

}

// MARK: - Builder pattern for NSMutableAttributedString

public extension NSMutableAttributedString {

    public func withFont(font: UIFont) -> NSMutableAttributedString {

        addAttributes([
            NSFontAttributeName: font
        ], range: NSRange(location: 0, length: string.characters.count))

        return self
    }

}
