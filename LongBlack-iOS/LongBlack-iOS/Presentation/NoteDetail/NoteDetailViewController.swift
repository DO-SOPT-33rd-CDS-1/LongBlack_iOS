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
        setUI()
    }
    
    let backButton = UIButton()
    let bookmarkButton = UIButton()
    let topView = UIView()
    let bottomView = UIView()
    lazy var placeBookmarkButton: UIButton = {
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
    
    override func setStyle() {
        placeBookmarkButton.layer.cornerRadius = 23
        placeBookmarkButton.layer.borderColor = UIColor.subGray3.cgColor // subGray3 -> subGray5으로 변경예정
        placeBookmarkButton.layer.borderWidth = 1
        
        topView.backgroundColor = .subGray1
        bottomView.backgroundColor = .white
        backButton.tintColor = .white
        bookmarkButton.tintColor = .white
    }
    
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
    
}
