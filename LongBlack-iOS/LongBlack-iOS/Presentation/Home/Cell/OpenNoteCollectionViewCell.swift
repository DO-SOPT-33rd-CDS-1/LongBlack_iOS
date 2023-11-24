//
//  OpenNoteCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/23/23.
//

import UIKit

import SnapKit
import Then

final class OpenNoteCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "OpenNoteCollectionViewCell"
    
    let openNoteImageView = UIImageView()
    let openNoteTitleLabel = UILabel()
    let openNoteseparatorLineView = UIView()
    
    let openNoteWriterStackView = UIStackView()
    let openNoteWriterNameLabel = UILabel()
    let openNoteNameseparatorLineView = UIView()
    let openNoteInitialLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        openNoteTitleLabel.do {
            $0.setTextWithLineHeight(text: "", lineHeight: 25.33)
            $0.textColor = .subGray1
            $0.font = .h7Semibold
            $0.lineBreakMode = .byCharWrapping
            $0.textAlignment = .left
        }
        
        openNoteseparatorLineView.do {
            $0.backgroundColor = .subGray4
        }
        
        openNoteWriterStackView.do {
            $0.axis = .horizontal
            $0.spacing = 13
        }
        
        openNoteWriterNameLabel.do {
            $0.textColor = .subGray2
            $0.font = .b3Medium
        }
        
        openNoteNameseparatorLineView.do {
            $0.backgroundColor = .subGray4
        }
        
        openNoteInitialLabel.do {
            $0.font = .b3Medium
            $0.textColor = .mainPointBlue
        }
    }
    
    private func setLayout() {
        self.addSubviews(openNoteImageView,
                         openNoteTitleLabel,
                         openNoteseparatorLineView,
                         openNoteWriterStackView)
        
        openNoteWriterStackView.addArrangedSubviews(openNoteWriterNameLabel,
                                                    openNoteNameseparatorLineView,
                                                    openNoteInitialLabel)
        
        openNoteImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        openNoteTitleLabel.snp.makeConstraints {
            $0.top.equalTo(openNoteImageView.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview()
        }
        
        openNoteseparatorLineView.snp.makeConstraints {
            $0.top.equalTo(openNoteTitleLabel.snp.bottom).offset(9)
            $0.width.centerX.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        openNoteWriterStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(openNoteseparatorLineView.snp.bottom).offset(9)
        }
        
        openNoteNameseparatorLineView.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }
    }
    
    func bindOpenNoteData(data: OpenNoteModel) {
        self.openNoteImageView.image = data.image
        self.openNoteTitleLabel.setTextWithLineHeight(text: data.title, lineHeight: 25.33)
        self.openNoteTitleLabel.textAlignment = .left
        self.openNoteWriterNameLabel.text = data.writer
        self.openNoteInitialLabel.text = data.initial
    }
}
