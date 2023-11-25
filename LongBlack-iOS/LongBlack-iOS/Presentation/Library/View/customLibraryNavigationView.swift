//
//  customLibraryNavigationView.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/25/23.
//

import UIKit

import SnapKit

class CustomLibraryNavigationView: UIView {

    private let libraryViewbackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(StringLiterals.Library.Title.libraryTitle, for: .normal)
        button.setImage(ImageLiterals.Library.icArrowLeft, for: .normal)
        button.titleLabel?.font = .h3Semibold
        button.setTitleColor(.subGray1, for: .normal)
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        addSubviews(libraryViewbackButton)
        self.backgroundColor = .white
    }

    private func setupConstraints() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(69)
        }
        
        libraryViewbackButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
        }
    }
}
