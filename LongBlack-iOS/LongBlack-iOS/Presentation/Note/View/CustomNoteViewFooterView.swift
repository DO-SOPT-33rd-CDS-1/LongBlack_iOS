//
//  CustomNoteViewFooterView.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/24/23.
//


import UIKit

import Then
import SnapKit


class CustomNoteViewFooterView: UICollectionReusableView {
    
    static let identifier = "CustomNoteViewFooterView"
    
    private let footerFrameView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private var noteViewPageNumber = UIImageView().then {
        $0.image = UIImage(named: "number")
        $0.contentMode = .scaleToFill
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupViews()
        setupConstraints()
    }
    
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
        self.backgroundColor = .clear
    }
    
    private func setupConstraints() {
        
        self.addSubview(footerFrameView)
        footerFrameView.addSubview(noteViewPageNumber)
        
        footerFrameView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        noteViewPageNumber.snp.makeConstraints {
            $0.top.equalToSuperview().inset(36)
            $0.leading.equalToSuperview().inset(73)
        }
    }
}

