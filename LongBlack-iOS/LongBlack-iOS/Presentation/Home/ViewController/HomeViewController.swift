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
    // TODO: MARK 주석 달기
    
    private let logoImageView = UIImageView()
    private let homeMainView = HomeMainView()
    private let mainSeperatorView = UIView()
    private let noteHomeButton = HomeButton()
    private let libraryHomeButton = HomeButton()
    private let buttonSeperatorView = UIView()
    private let homeOpenNote = HomeOpenNote()
    private let openNoteSeperatorView = UIView()
    private let homeEventView = HomeEventView()
    
    private let scrollView = UIScrollView()
    
    private var homeTimer: Timer?
    private var currentEventPageIndex = 0
    
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
        
        openNoteSeperatorView.do {
            $0.backgroundColor = .subGray6
        }
    }
    
    override func setLayout() {
        view.addSubviews(scrollView)
        
        scrollView.addSubviews(logoImageView,
                               homeMainView,
                               mainSeperatorView,
                               noteHomeButton,
                               libraryHomeButton,
                               buttonSeperatorView,
                               homeOpenNote,
                               openNoteSeperatorView,
                               homeEventView)
                
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(20)
        }
        
        homeMainView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(12)
            $0.leading.trailing.width.equalToSuperview()
        }
        
        mainSeperatorView.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.height.equalTo(8)
            $0.top.equalTo(homeMainView.noteCommunityStackView.snp.bottom).offset(27)
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
        
        homeOpenNote.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.top.equalTo(buttonSeperatorView.snp.bottom).offset(37)
            $0.height.equalTo(301)
        }
        
        openNoteSeperatorView.snp.makeConstraints {
            $0.centerX.width.equalToSuperview()
            $0.height.equalTo(8)
            $0.top.equalTo(homeOpenNote.snp.bottom).offset(50)
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
        if collectionView == homeOpenNote.openNoteCollectionView {
            return openNoteDummy.count
        } else {
            return eventImageDummy.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeOpenNote.openNoteCollectionView {
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

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /// 제스쳐를 통해서 스크롤 했을 때도 index가 반영이 되어야 하기 때문에 적용
        if scrollView == homeEventView.eventImageCollectionView {
            let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
            currentEventPageIndex = pageIndex
        }
    }
}

extension HomeViewController {
    
    private func setCollectionView() {
        self.homeEventView.eventImageCollectionView.register(EventImageCollectionViewCell.self, forCellWithReuseIdentifier: EventImageCollectionViewCell.identifier)
        
        self.homeOpenNote.openNoteCollectionView.register(OpenNoteCollectionViewCell.self, forCellWithReuseIdentifier: OpenNoteCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        self.homeOpenNote.openNoteCollectionView.delegate = self
        self.homeOpenNote.openNoteCollectionView.dataSource = self
        self.homeEventView.eventImageCollectionView.delegate = self
        self.homeEventView.eventImageCollectionView.dataSource = self
        self.homeEventView.eventImageCollectionView.delegate = self
    }
    
    private func setAddTarget() {
        self.homeTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        noteHomeButton.addTarget(self, action: #selector(noteHomeButtonTapped), for: .touchUpInside)
        libraryHomeButton.addTarget(self, action: #selector(libraryHomeButtonTapped), for: .touchUpInside)
        
        self.homeEventView.rightButton.addTarget(self, action: #selector(eventRightButtonTapped), for: .touchUpInside)
        self.homeEventView.leftButton.addTarget(self, action: #selector(eventLeftButtonTapped), for: .touchUpInside)
    }
    
    @objc private func noteHomeButtonTapped() {
        print("여기에 전체 노트 연결")
    }
    
    @objc private func libraryHomeButtonTapped() {
        print("여기에 라이브러리 연결")
    }
    
    @objc private func eventRightButtonTapped() {
        currentEventPageIndex += 1
        
        if currentEventPageIndex >= openNoteDummy.count {
            currentEventPageIndex = 0
        }
        
        let contentOffset = CGPoint(x: CGFloat(currentEventPageIndex) * homeEventView.eventImageCollectionView.frame.width, y: 0)
        homeEventView.eventImageCollectionView.setContentOffset(contentOffset, animated: true)
    }
    
    @objc private func eventLeftButtonTapped() {
        currentEventPageIndex -= 1
        
        if currentEventPageIndex < 0 {
            currentEventPageIndex = openNoteDummy.count - 1
        }
        
        let contentOffset = CGPoint(x: CGFloat(currentEventPageIndex) * homeEventView.eventImageCollectionView.frame.width, y: 0)
        homeEventView.eventImageCollectionView.setContentOffset(contentOffset, animated: true)
    }
    
    @objc private func updateTime() {
        let currentDate = Date()
        let calendar = Calendar.current
        guard let endOfDay = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: currentDate) else { return }
        
        let components = calendar.dateComponents([.hour, .minute, .second], from: currentDate, to: endOfDay)
        
        let formattedTime = String(format: "%02d : %02d : %02d", components.hour ?? 0, components.minute ?? 0, components.second ?? 0)
        homeMainView.timeLabel.text = formattedTime
    }
}
