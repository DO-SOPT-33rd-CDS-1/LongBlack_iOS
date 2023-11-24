//
//  HomeButton.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class HomeButton: UIButton {
    
    let buttonImageView = UIImageView()
    let buttonTitleLabel = UILabel()
    let arrowImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        buttonTitleLabel.do {
            $0.font = .b5Mudium
            $0.textColor = .subGray1
        }
        
        arrowImageView.do {
            $0.image = ImageLiterals.Home.icArrow
        }
    }
    
    private func setLayout() {
        self.addSubviews(buttonImageView,
                         buttonTitleLabel,
                         arrowImageView)
        
        self.snp.makeConstraints {
            $0.height.equalTo(44)
        }
        
        buttonImageView.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        
        buttonTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(buttonImageView.snp.trailing).offset(12)
            $0.centerY.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
            $0.leading.equalTo(buttonTitleLabel.snp.trailing).offset(12)
        }
    }
}
