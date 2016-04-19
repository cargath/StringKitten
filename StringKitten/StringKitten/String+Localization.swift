//
//  String+Localization.swift
//  StringKitten
//
//  Created by Carsten Könemann on 19.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public extension String {

    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
