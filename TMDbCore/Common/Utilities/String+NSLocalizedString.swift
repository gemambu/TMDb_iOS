//
//  String+NSLocalizedString.swift
//  TMDbCore
//
//  Created by Gema Martinez on 7/12/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

extension String {
    public func localizedString() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

