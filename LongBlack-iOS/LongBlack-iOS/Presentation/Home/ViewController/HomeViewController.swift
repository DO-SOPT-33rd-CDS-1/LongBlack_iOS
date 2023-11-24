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
    // TODO: 이벤트뷰 기능 연결
    // TODO: 뷰 분리
    
    private let logoImageView = UIImageView()
    
    private let timeView = UIView()
    private let timeImageView = UIImageView()
    private let timeTitleLabel = UILabel()
    private let timeLabel = UILabel()
    
    private let mainBackgroundView = UIView()
    private let mainImageView = UIImageView()
    private let todaysNoteLabel = UILabel()
    private let todaysNoteTitleLabel = UILabel()
    
    private let noteCommunityLabel = UILabel()
    private let noteCommunityStackView = UIStackView()
    private let noteCommunityThumbnail = UIImageView()
    private let noteCommunityDescription = UILabel()
    
    private let mainSeperatorView = UIView()
    
    private let noteHomeButton = HomeButton()
    private let libraryHomeButton = HomeButton()
    private let buttonSeperatorView = UIView()
    
    private let openNoteLabel = UILabel()
    private lazy var openNoteCollectionView = UICollectionView(frame: .zero,
                                                               collectionViewLayout: openNoteFlowLayout)
    private let openNoteFlowLayout = UICollectionViewFlowLayout()
    private let openNoteSeperatorView = UIView()
    
    private let homeEventView = HomeEventView()
    
    private let scrollView = UIScrollView()
    
    private var homeTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setDelegate()
        setAddTarget()
    }
    
    deinit {
        // 타이머 해제
        homeTimer?.invalidate()
    }
    
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
        }
        
        timeLabel.do {
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
        
        openNoteLabel.do {
            $0.text = StringLiterals.Home.Open.openNote
            $0.font = .h5Semibold
            $0.textColor = .subGray1
        }
        
        openNoteCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
        }
        
        openNoteFlowLayout.do {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 27
            $0.itemSize = CGSize(width: 300, height: 254)
            $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 27)
        }
        
        openNoteSeperatorView.do {
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
                               buttonSeperatorView,
                               openNoteLabel,
                               openNoteCollectionView,
                               openNoteSeperatorView,
                               homeEventView)
        
        timeView.addSubviews(timeImageView,
                             timeTitleLabel,
                             timeLabel)
        
        noteCommunityStackView.addArrangedSubviews(noteCommunityThumbnail,
                                                   noteCommunityDescription)
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
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
        }
        
        openNoteLabel.snp.makeConstraints {
            $0.top.equalTo(buttonSeperatorView.snp.bottom).offset(37)
            $0.leading.equalToSuperview().inset(20)
        }
        
        openNoteCollectionView.snp.makeConstraints {
            $0.top.equalTo(openNoteLabel.snp.bottom).offset(17)
            $0.leading.equalTo(openNoteLabel)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(254)
        }
        
        openNoteSeperatorView.snp.makeConstraints {
            $0.centerX.width.equalToSuperview()
            $0.height.equalTo(8)
            $0.top.equalTo(openNoteCollectionView.snp.bottom).offset(50)
        }
        
        homeEventView.snp.makeConstraints {
            $0.top.equalTo(openNoteSeperatorView.snp.bottom).offset(35)
            $0.width.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(37)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate { }
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == openNoteCollectionView {
            return openNoteDummy.count
        } else {
            return eventImageDummy.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == openNoteCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OpenNoteCollectionViewCell.identifier, for: indexPath) as? OpenNoteCollectionViewCell else { return UICollectionViewCell() }
            cell.bindOpenNoteData(data: openNoteDummy[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventImageCollectionViewCell.identifier, for: indexPath) as? EventImageCollectionViewCell else { return UICollectionViewCell() }
            cell.bindEventImageData(data: eventImageDummy[indexPath.row])
                return cell
        }
    }
}

extension HomeViewController {
    
    private func setCollectionView() {
        self.homeEventView.eventImageCollectionView.register(EventImageCollectionViewCell.self, forCellWithReuseIdentifier: EventImageCollectionViewCell.identifier)

        self.openNoteCollectionView.register(OpenNoteCollectionViewCell.self, forCellWithReuseIdentifier: OpenNoteCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        self.openNoteCollectionView.delegate = self
        self.openNoteCollectionView.dataSource = self
        self.homeEventView.eventImageCollectionView.delegate = self
        self.homeEventView.eventImageCollectionView.dataSource = self
    }
    
    private func setAddTarget() {
        self.homeTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        noteHomeButton.addTarget(self, action: #selector(noteHomeButtonTapped), for: .touchUpInside)
        libraryHomeButton.addTarget(self, action: #selector(libraryHomeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func noteHomeButtonTapped() {
        print("여기에 전체 노트 연결")
    }
    
    @objc private func libraryHomeButtonTapped() {
        print("여기에 라이브러리 연결")
    }
    
    @objc private func updateTime() {
        let currentDate = Date()
        let calendar = Calendar.current
        guard let endOfDay = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: currentDate) else { return }

        let components = calendar.dateComponents([.hour, .minute, .second], from: currentDate, to: endOfDay)

        let formattedTime = String(format: "%02d : %02d : %02d", components.hour ?? 0, components.minute ?? 0, components.second ?? 0)
        timeLabel.text = formattedTime
    }
}
