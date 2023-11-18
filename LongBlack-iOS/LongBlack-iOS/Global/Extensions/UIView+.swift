//
//  UIView+.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
