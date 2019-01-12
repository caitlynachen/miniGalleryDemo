//
//  Styleguide.swift
//  Finders Keepers
//
//  Created by Adrian Wisaksana on 10/01/2018.
//  Copyright © 2018 Numeral. All rights reserved.
//

import UIKit
//import GoogleMaps

struct Style {

    struct Font {
        static let largeHeavy = UIFont(name: "Avenir-Heavy", size: 36)!

        static let h1Heavy = UIFont(name: "Avenir-Heavy", size: 28)!
        static let h2Heavy = UIFont(name: "Avenir-Heavy", size: 24)!
        static let h2Book = UIFont(name: "Avenir-Book", size: 24)!
        static let h3Heavy = UIFont(name: "Avenir-Heavy", size: 18)!
        static let h3Book = UIFont(name: "Avenir-Book", size: 18)!
        static let h4Heavy = UIFont(name: "Avenir-Heavy", size: 16)!
        static let h4Book = UIFont(name: "Avenir-Book", size: 16)!
        static let h5Heavy = UIFont(name: "Avenir-Heavy", size: 14)!
        static let h5Book = UIFont(name: "Avenir-Book", size: 14)!

        static let bodyLarge = UIFont(name: "Avenir-Book", size: 18)!
        static let bodyMedium = UIFont(name: "Avenir-Book", size: 16)!
        static let bodyNormal = UIFont(name: "Avenir-Book", size: 14)!
        static let bodySmall = UIFont(name: "Avenir-Book", size: 13)!
    }


    enum Spacing: CGFloat {
        case smallest = 8
        case small = 16
        case normal = 24
        case medium = 32
        case large = 56

        static func + (_ left: Style.Spacing, _ right: Style.Spacing) -> CGFloat {
            return left.rawValue + right.rawValue
        }
    }

    enum Shadow {
        case black4
        case black24
        case darkGray32
        case darkGray40
        case custom(opacity: Float, offset: CGSize, color: CGColor, radius: CGFloat)
    }

    
}
