//
//  CustomNavigationView.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/23/23.
//

import UIKit
import SnapKit

class CustomNavigationView: UIView {

    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("노트", for: .normal)
        button.setImage(UIImage(named: "ic_arrow_left"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "검색어를 입력하세요"
        searchBar.backgroundImage = UIImage()
        searchBar.layer.cornerRadius = 32
        searchBar.backgroundColor = UIColor.clear
        searchBar.isTranslucent = true
        searchBar.barTintColor = .clear
        return searchBar
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
        addSubviews(backButton, searchBar)
        
        self.backgroundColor = .white
    }

    private func setupConstraints() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(72)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(21)
        }

        searchBar.snp.makeConstraints {
            $0.width.equalTo(210)
            $0.leading.equalToSuperview().offset(145)
            $0.centerY.equalToSuperview()
        }
    }
}
