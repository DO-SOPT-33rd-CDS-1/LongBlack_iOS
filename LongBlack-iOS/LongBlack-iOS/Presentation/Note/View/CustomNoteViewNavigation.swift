//
//  CustomNoteViewNavigation.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/24/23.
//

import UIKit

import SnapKit

class CustomNoteViewNavigationView: UIView {

    private let noteViewbackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(StringLiterals.Note.TabBar.noteViewTitle, for: .normal)
        button.setImage(ImageLiterals.Note.icNoteBackButton, for: .normal)
        button.titleLabel?.font = .h3Semibold
        button.setTitleColor(.subGray1, for: .normal)
        return button
    }()

    private let noteViewSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = StringLiterals.Note.TabBar.noteViewSearchPlaceholder
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
        addSubviews(noteViewbackButton, noteViewSearchBar)
        self.backgroundColor = .white
    }

    private func setupConstraints() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(72)
        }
        
        noteViewbackButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(21)
        }

        noteViewSearchBar.snp.makeConstraints {
            $0.width.equalTo(210)
            $0.leading.equalToSuperview().offset(145)
            $0.centerY.equalToSuperview()
        }
    }
}
