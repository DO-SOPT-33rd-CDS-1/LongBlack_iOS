//
//  HomeTabBar.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/21/23.
//

import UIKit

class HomeTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
