//
//  UITabBar+.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/19/23.
//

import UIKit

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().alpha = 0.15
    }
}
