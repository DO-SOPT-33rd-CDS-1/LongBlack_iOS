//
//  CALayer+.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/19/23.
//

import UIKit

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 1,
        x: CGFloat = 0,
        y: CGFloat = 4,
        blur: CGFloat = 13
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}
