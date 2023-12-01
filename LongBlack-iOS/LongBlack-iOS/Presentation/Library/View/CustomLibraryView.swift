//
//  customLibraryNavigationView.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/25/23.
//

import UIKit

import SnapKit

class CustomLibraryNavigationView: BaseView {

    private let libraryViewbackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(StringLiterals.Library.Title.libraryTitle, for: .normal)
        button.setImage(ImageLiterals.Library.icArrowLeft, for: .normal)
        button.titleLabel?.font = .h3Semibold
        button.setTitleColor(.subGray1, for: .normal)
        return button
    }()


    override func setStyle() {
        self.backgroundColor = .white
    }

    override func setLayout() {
        addSubviews(libraryViewbackButton)
        
        self.snp.makeConstraints {
            $0.height.equalTo(65)
        }
        
        libraryViewbackButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
