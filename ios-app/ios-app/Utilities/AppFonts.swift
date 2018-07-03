//
//  AppFonts.swift
//  ios-app
//
//  Created by Vincent Chau on 7/3/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import UIKit

struct AppFonts {
    static let AvenirLight12 = UIFont(name: "Avenir-Light", size: 12)!
    static let AvenirLight20 = UIFont(name: "Avenir-Light", size: 20)!
    static let AvenirLight24 = UIFont(name: "Avenir-Light", size: 24)!
    static let AvenirLight50 = UIFont(name: "Avenir-Light", size: 50)!

    static let AvenirHeavy11 = UIFont(name: "Avenir-Heavy", size: 11)!
    static let AvenirHeavy12 = UIFont(name: "Avenir-Heavy", size: 12)!
    static let AvenirHeavy14 = UIFont(name: "Avenir-Heavy", size: 14)!
    static let AvenirHeavy15 = UIFont(name: "Avenir-Heavy", size: 15)!
    static let AvenirHeavy16 = UIFont(name: "Avenir-Heavy", size: 16)!
    static let AvenirHeavy17 = UIFont(name: "Avenir-Heavy", size: 17)!
    static let AvenirHeavy18 = UIFont(name: "Avenir-Heavy", size: 18)!
    static let AvenirHeavy20 = UIFont(name: "Avenir-Heavy", size: 20)!
    static let AvenirHeavy21 = UIFont(name: "Avenir-Heavy", size: 21)!
    static let AvenirHeavy22 = UIFont(name: "Avenir-Heavy", size: 22)!
    static let AvenirHeavy24 = UIFont(name: "Avenir-Heavy", size: 24)!
    static let AvenirHeavy28 = UIFont(name: "Avenir-Heavy", size: 28)!
    static let AvenirHeavy90 = UIFont(name: "Avenir-Heavy", size: 90)!

    static let AvenirMedium11 = UIFont(name: "Avenir-Medium", size: 11)!
    static let AvenirMedium12 = UIFont(name: "Avenir-Medium", size: 12)!
    static let AvenirMedium13 = UIFont(name: "Avenir-Medium", size: 13)!
    static let AvenirMedium14 = UIFont(name: "Avenir-Medium", size: 14)!
    static let AvenirMedium15 = UIFont(name: "Avenir-Medium", size: 15)!
    static let AvenirMedium16 = UIFont(name: "Avenir-Medium", size: 16)!
    static let AvenirMedium17 = UIFont(name: "Avenir-Medium", size: 17)!
    static let AvenirMedium18 = UIFont(name: "Avenir-Medium", size: 18)!
    static let AvenirMedium20 = UIFont(name: "Avenir-Medium", size: 20)!

    static let AvenirRoman12  = UIFont(name: "Avenir-Roman", size: 12)!
    static let AvenirRoman13  = UIFont(name: "Avenir-Roman", size: 13)!
    static let AvenirRoman14  = UIFont(name: "Avenir-Roman", size: 14)!
    static let AvenirRoman15  = UIFont(name: "Avenir-Roman", size: 15)!
    static let AvenirRoman17  = UIFont(name: "Avenir-Roman", size: 17)!
    static let AvenirRoman18  = UIFont(name: "Avenir-Roman", size: 18)!
    static let AvenirRoman20  = UIFont(name: "Avenir-Roman", size: 20)!
    static let AvenirRoman24  = UIFont(name: "Avenir-Roman", size: 24)!

    static let AvenirBook11  = UIFont(name: "Avenir-Book", size: 11)!
    static let AvenirBook13  = UIFont(name: "Avenir-Book", size: 13)!
    static let AvenirBook14  = UIFont(name: "Avenir-Book", size: 14)!
    static let AvenirBook15  = UIFont(name: "Avenir-Book", size: 15)!
    static let AvenirBook17  = UIFont(name: "Avenir-Book", size: 17)!
    static let AvenirBlack28  = UIFont(name: "Avenir-Black", size: 28)!
}

struct Fonts {
    enum Weight: String {
        case Light = "Light"
        case Heavy = "Heavy"
        case Medium = "Medium"
        case Roman = "Roman"
        case Book = "Book"
    }

    static func appFontWithWeight(_ weight: Weight, size: CGFloat) -> UIFont {
        let name = "Avenir-\(weight.rawValue)"
        return UIFont(name: name, size: size)!
    }
}
