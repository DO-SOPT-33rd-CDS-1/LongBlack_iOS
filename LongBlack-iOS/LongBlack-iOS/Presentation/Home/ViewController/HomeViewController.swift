//
//  HomeViewController.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    let logoImageView = UIImageView()
    
    let timeView = UIView()
    let timeImageView = UIImageView()
    let timeTitleLabel = UILabel()
    let timeLabel = UILabel()
    
    let mainBackgroundView = UIView()
    let mainImageView = UIImageView()
    let todaysNoteLabel = UILabel()
    let todaysNoteTitleLabel = UILabel()
    
    let noteCommunityLabel = UILabel()
    let noteCommunityStackView = UIStackView()
    let noteCommunityThumbnail = UIImageView()
    let noteCommunityDescription = UILabel()
    
    let mainSeperatorView = UIView()
    
    let noteHomeButton = HomeButton()
    let libraryHomeButton = HomeButton()
    
    let buttonSeperatorView = UIView()

    
    let scrollView = UIScrollView()
    
    override func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
        
        logoImageView.do {
            $0.image = ImageLiterals.Home.imgLongBlack
        }
        
        timeView.do {
            $0.backgroundColor = .subGray1
        }
        
        timeImageView.do {
            $0.image = ImageLiterals.Home.icClock
        }
        
        timeTitleLabel.do {
            $0.setTextWithLineHeight(text: StringLiterals.Home.Time.titleLabel, lineHeight: 19.5)
            $0.font = .b5Mudium
            $0.textColor = .white
            $0.numberOfLines = 2
            $0.contentMode = .center
            $0.contentMode = .center
        }
        
        timeLabel.do {
            $0.text = "01 : 45 : 07"
            $0.font = .h1Light
            $0.textColor = .white
        }
        
        mainBackgroundView.do {
            $0.backgroundColor = .subcolorSand
        }
        
        mainImageView.do {
            $0.image = ImageLiterals.Home.imgHomeTop
            $0.contentMode = .scaleAspectFit
        }
        
        todaysNoteLabel.do {
            $0.text = StringLiterals.Home.Main.todaysNote
            $0.font = .b3Medium
            $0.textColor = .mainMainOrange
        }
        
        todaysNoteTitleLabel.do {
            $0.setTextWithLineHeight(text: StringLiterals.Home.Main.todaysNoteTitle, lineHeight: 30)
            $0.font = .h5Semibold
            $0.textColor = .subGray1
            $0.lineBreakMode = .byCharWrapping
            $0.textAlignment = .left
        }
        
        noteCommunityLabel.do {
            $0.text = StringLiterals.Home.Main.noteCommunity
            $0.font = .b3Medium
            $0.textColor = .mainMainOrange
        }
        
        noteCommunityStackView.do {
            $0.axis = .horizontal
            $0.spacing = 16
        }
        
        noteCommunityThumbnail.do {
            $0.image = ImageLiterals.Home.imgThumbnail
            $0.contentMode = .scaleAspectFill
        }
        
        noteCommunityDescription.do {
            $0.setTextWithLineHeight(text: StringLiterals.Home.Main.noteCommunityDescription, lineHeight: 19.37)
            $0.font = .b6Regular
            $0.textColor = .subGray1
            $0.lineBreakMode = .byCharWrapping
            $0.textAlignment = .left
        }
        
        mainSeperatorView.do {
            $0.backgroundColor = .subGray6
        }
        
        noteHomeButton.do {
            $0.buttonImageView.image = ImageLiterals.Home.icNote
            $0.buttonTitleLabel.text = StringLiterals.Home.Main.noteButton
        }
        
        libraryHomeButton.do {
            $0.buttonImageView.image = ImageLiterals.Home.icLibrary
            $0.buttonTitleLabel.text = StringLiterals.Home.Main.libraryButton
        }
        
        buttonSeperatorView.do {
            $0.backgroundColor = .subGray6
        }
    }
    
    override func setLayout() {
        view.addSubviews(scrollView)
        
        scrollView.addSubviews(logoImageView,
                               timeView,
                               mainBackgroundView,
                               mainImageView,
                               todaysNoteLabel,
                               todaysNoteTitleLabel,
                               noteCommunityLabel,
                               noteCommunityStackView,
                               mainSeperatorView,
                               noteHomeButton,
                               libraryHomeButton,
                               buttonSeperatorView)
        
        timeView.addSubviews(timeImageView,
                             timeTitleLabel,
                             timeLabel)
        
        noteCommunityStackView.addArrangedSubviews(noteCommunityThumbnail,
                                                   noteCommunityDescription)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).offset(60)
            $0.leading.equalToSuperview().inset(20)
        }
        
        timeView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(12)
            $0.width.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        timeImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        timeTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(timeImageView.snp.trailing).offset(6)
        }
        
        timeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        
        mainBackgroundView.snp.makeConstraints {
            $0.top.equalTo(timeView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(260)
        }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalTo(mainBackgroundView).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        todaysNoteLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(27)
            $0.leading.equalToSuperview().inset(20)
        }
        
        todaysNoteTitleLabel.snp.makeConstraints{
            $0.top.equalTo(todaysNoteLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(UIScreen.main.bounds.width - 40)
        }
        
        noteCommunityLabel.snp.makeConstraints {
            $0.top.equalTo(todaysNoteTitleLabel.snp.bottom).offset(24)
            $0.leading.equalTo(todaysNoteLabel)
        }
        
        noteCommunityStackView.snp.makeConstraints {
            $0.top.equalTo(noteCommunityLabel.snp.bottom).offset(8)
            $0.leading.equalTo(noteCommunityLabel).inset(16)
            $0.centerX.equalToSuperview()
        }
        
        mainSeperatorView.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.height.equalTo(8)
            $0.top.equalTo(noteCommunityStackView.snp.bottom).offset(27)
        }
        
        noteHomeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(mainSeperatorView.snp.bottom).offset(26)
        }
        
        libraryHomeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(mainSeperatorView.snp.bottom).offset(26)
        }
        
        buttonSeperatorView.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.height.equalTo(8)
            $0.top.equalTo(libraryHomeButton.snp.bottom).offset(27)
            $0.bottom.equalToSuperview().inset(100)
        }
    }
}
