//
//  UIViews+Create.swift
//  Finders Keepers
//
//  Created by Adrian Wisaksana on 11/01/2018.
//  Copyright © 2018 Numeral. All rights reserved.
//

import UIKit

protocol Creatable {

    init()

}

extension Creatable {

    /// Creates a view with a configuration block.
    ///
    /// - parameter configure: The configuration block.
    /// - returns: The configured view.
    static func create(_ configure: (Self) -> Void) -> Self {

        let view = Self()
        configure(view)

        return view

    }
}

extension UIView: Creatable {}
extension CALayer: Creatable {}
