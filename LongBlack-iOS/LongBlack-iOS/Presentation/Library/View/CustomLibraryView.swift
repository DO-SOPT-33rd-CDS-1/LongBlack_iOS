//
//  customLibraryNavigationView.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/25/23.
//

import UIKit

import SnapKit

class CustomLibraryNavigationView: BaseView {

    override func setStyle() {
        self.backgroundColor = .white
    }

    override func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(65)
        }
    }
}
