//
//  NoteDetailViewController.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

import UIKit

import SnapKit
import Then

// MARK: - NoteViewController class
class NoteDetailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NoteViewDetailController"
        setUI()
    }
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_arrow_left"), for: .normal)
        button.addTarget(button, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icBookmark"), for: .normal)
        button.setImage(UIImage(named: "icBookmarkFill"), for: .selected)
        return button
    }()
    let topView = UIView()
    let bottomView = UIView()
    private lazy var placeBookmarkButton: UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.text = "책갈피 꽂기"
        label.textColor = .mainMainOrange
        label.font = UIFont.systemFont(ofSize: 14)
        
        button.addSubviews(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        return button
    }()
    
    let collectionView = UICollectionView()
    
    // MARK: - setStyle()
    override func setStyle() {
        placeBookmarkButton.layer.cornerRadius = 23
        placeBookmarkButton.layer.borderColor = UIColor.subGray5.cgColor
        placeBookmarkButton.layer.borderWidth = 1
        
        topView.backgroundColor = .subGray1
        bottomView.backgroundColor = .white
        backButton.tintColor = .white
        bookmarkButton.tintColor = .white
    }
    
    // MARK: - setLayout()
    override func setLayout() {
        [topView, bottomView].forEach() {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        topView.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        bottomView.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(53)
        }
        [backButton, bookmarkButton].forEach() {
            bottomView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        backButton.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        bookmarkButton.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - backButtonTapped()
    @objc private func backButtonTapped() {
           // 뒤로가기 버튼이 눌렸을 때 Home으로 가는 동작
    }
    
}
