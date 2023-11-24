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
    
    // MARK: - Variables
    // MARK: Component
    private let eventTitleLabel = UILabel()
    let leftButton = UIButton()
    let rightButton = UIButton()
    
    lazy var eventImageCollectionView = UICollectionView(frame: .zero,
                                                         collectionViewLayout: eventImageFlowLayout)
    let eventImageFlowLayout = UICollectionViewFlowLayout()
    let bannerImageView = UIImageView()
    
    // MARK: Constants
    let collectionViewWidth = UIScreen.main.bounds.width - 40
    lazy var collectionViewHeight = collectionViewWidth * 260 / 335
    
    // MARK: - Function
    // MARK: Layout Helpers
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
        
        eventImageCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.layer.cornerRadius = 8
            $0.isPagingEnabled = true
        }
        
        eventImageFlowLayout.do {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 0
            $0.itemSize = CGSize(width: collectionViewWidth, height: collectionViewHeight)
        }
        
        bannerImageView.do {
            $0.image = ImageLiterals.Home.imgEventBanner
        }
    }
    
    override func setLayout() {
        self.addSubviews(eventTitleLabel,
                         leftButton,
                         rightButton,
                         eventImageCollectionView,
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
        
        eventImageCollectionView.snp.makeConstraints {
            $0.top.equalTo(eventTitleLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(collectionViewHeight)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(eventImageCollectionView.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}
