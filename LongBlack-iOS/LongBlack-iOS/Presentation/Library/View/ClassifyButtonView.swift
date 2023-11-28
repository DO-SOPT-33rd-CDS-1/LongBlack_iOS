//
//  ClassifyButtonView.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/29/23.
//

import UIKit

import SnapKit

class ClassifyButtonView: BaseView {

    private let beforeExchangedButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(StringLiterals.Library.Button.beforeExchangedButton, for: .normal)
        button.titleLabel?.font = .b5Mudium
        button.setTitleColor(.subGray1, for: .normal)
        button.layer.cornerRadius = 14
        button.backgroundColor = .subGray5
        return button
    }()
    
    private let exchangedButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(StringLiterals.Library.Button.exchangedButton, for: .normal)
        button.titleLabel?.font = .b5Mudium
        button.setTitleColor(.subGray1, for: .normal)
        button.layer.borderColor = UIColor.subGray5.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 14
        button.backgroundColor = .white
        return button
    }()


    override func setStyle() {
        addSubviews(beforeExchangedButton, exchangedButton)
        self.backgroundColor = .white
    }

    override func setLayout() {
    
        self.snp.makeConstraints {
            $0.height.equalTo(28)
        }
        
        beforeExchangedButton.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.height.equalTo(28)
            $0.width.equalTo(65)
        }
        
        exchangedButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalTo(beforeExchangedButton.snp.trailing).offset(8)
            $0.height.equalTo(28)
            $0.width.equalTo(76)
        }
    }
}

