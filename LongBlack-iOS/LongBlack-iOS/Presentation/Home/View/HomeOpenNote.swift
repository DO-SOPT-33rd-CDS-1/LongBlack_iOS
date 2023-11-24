//
//  HomeOpenNote.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/24/23.
//

import UIKit

import SnapKit
import Then

class HomeOpenNote: BaseView {
    
    private let openNoteLabel = UILabel()
    lazy var openNoteCollectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: openNoteFlowLayout)
    private let openNoteFlowLayout = UICollectionViewFlowLayout()
    
    override func setStyle() {
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
    }
    
    override func setLayout() {
        self.addSubviews(
            openNoteLabel,
            openNoteCollectionView)
        
        openNoteLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        openNoteCollectionView.snp.makeConstraints {
            $0.top.equalTo(openNoteLabel.snp.bottom).offset(17)
            $0.leading.equalTo(openNoteLabel)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(254)
        }
    }
}
