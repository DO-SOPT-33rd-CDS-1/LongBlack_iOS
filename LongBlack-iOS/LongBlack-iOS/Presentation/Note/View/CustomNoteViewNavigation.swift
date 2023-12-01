//
//  CustomNoteViewNavigation.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/24/23.
//

import UIKit

import SnapKit

class CustomNoteViewNavigationView: UIView {
    
    private let noteViewSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = StringLiterals.Note.TabBar.noteViewSearchPlaceholder
        searchBar.backgroundImage = UIImage()
        searchBar.isTranslucent = true
        searchBar.barTintColor = .clear
        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
            searchTextField.backgroundColor = .subGray6
                let placeholderAttributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.subGray5
                ]
                let attributedPlaceholder = NSAttributedString(
                    string: StringLiterals.Note.TabBar.noteViewSearchPlaceholder,
                    attributes: placeholderAttributes
                )
                searchTextField.attributedPlaceholder = attributedPlaceholder
            }
        
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
        addSubviews(noteViewSearchBar)
        self.backgroundColor = .white
    }

    private func setupConstraints() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(72)
        }

        noteViewSearchBar.snp.makeConstraints {
            $0.width.equalTo(210)
            $0.leading.equalToSuperview().offset(145)
            $0.centerY.equalToSuperview()
        }
    }
}
