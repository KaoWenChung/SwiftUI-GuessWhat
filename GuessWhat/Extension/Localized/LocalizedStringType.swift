//
//  LocalizedStringType.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/14.
//

import Foundation

protocol LocalizedStringType {}

extension LocalizedStringType {
    var prefix: String { return "\(type(of: self))" }
    var text: String { return NSLocalizedString(prefix + "." + String(describing: self), comment: "") }
}
