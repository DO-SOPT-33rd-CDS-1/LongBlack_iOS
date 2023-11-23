//
//  HomeEventView.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/23/23.
//

import UIKit

import SnapKit
import Then

final class HomeEventView: BaseView {
    
    let eventTitleLabel = UILabel()
    let leftButton = UIButton()
    let rightButton = UIButton()
    
    // collectionView로 수정 예정
    let imageView = UIImageView()
    
    let bannerImageView = UIImageView()
    
    override func setStyle() {
        eventTitleLabel.do {
            $0.text = StringLiterals.Home.Event.event
            $0.font = .h5Semibold
            $0.textColor = .subGray1
        }
        
        leftButton.do {
            $0.setImage(ImageLiterals.Home.icArrowLeft, for: .normal)
        }
        
        rightButton.do {
            $0.setImage(ImageLiterals.Home.icArrowRight, for: .normal)
        }
        
        imageView.do {
            $0.image = ImageLiterals.Home.imgEventDummy1
        }
        
        bannerImageView.do {
            $0.image = ImageLiterals.Home.imgEventBanner
        }
    }
    
    override func setLayout() {
        self.addSubviews(eventTitleLabel,
                         leftButton,
                         rightButton,
                         imageView,
                         bannerImageView)
        
        eventTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        rightButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(eventTitleLabel)
        }
        
        leftButton.snp.makeConstraints {
            $0.trailing.equalTo(rightButton.snp.leading).offset(-12)
            $0.top.equalTo(rightButton)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(eventTitleLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}
