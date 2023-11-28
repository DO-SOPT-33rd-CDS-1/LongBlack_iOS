//
//  LibraryMakeCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/29/23.
//

import UIKit

class LibraryMakeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "LibraryMakeCollectionViewCell"
    
    private let stampSpot1 = UIImageView()
    private let stampSpot2 = UIImageView()
    private let stampSpot3 = UIImageView()
    private let stampSpot4 = UIImageView()
    private let stampSpot5 = UIImageView()
    private let stampSpot6 = UIImageView()
    private let stampSpot7 = UIImageView()
    private let stampSpot8 = UIImageView()
    private let stampSpot9 = UIImageView()
    private let stampSpot10 = UIImageView()
    private let stampSpot11 = UIImageView()
    private let stampSpot12 = UIImageView()
   
    
    private func setLayout() {
        self.contentView.addSubview(stampSpot1)
        
        stampSpot1.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(26)
        }
        stampSpot2.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(96)
        }
        stampSpot3.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(170)
        }
        stampSpot4.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(242)
        }
        stampSpot5.snp.makeConstraints {
            $0.top.equalToSuperview().inset(88)
            $0.leading.equalToSuperview().inset(26)
        }
        stampSpot6.snp.makeConstraints {
            $0.top.equalToSuperview().inset(88)
            $0.leading.equalToSuperview().inset(96)
        }
        stampSpot7.snp.makeConstraints {
            $0.top.equalToSuperview().inset(88)
            $0.leading.equalToSuperview().inset(170)
        }
        stampSpot8.snp.makeConstraints {
            $0.top.equalToSuperview().inset(88)
            $0.leading.equalToSuperview().inset(242)
        }
        stampSpot9.snp.makeConstraints {
            $0.top.equalToSuperview().inset(156)
            $0.leading.equalToSuperview().inset(26)
        }
        stampSpot10.snp.makeConstraints {
            $0.top.equalToSuperview().inset(156)
            $0.leading.equalToSuperview().inset(96)
        }
        stampSpot11.snp.makeConstraints {
            $0.top.equalToSuperview().inset(156)
            $0.leading.equalToSuperview().inset(170)
        }
        stampSpot12.snp.makeConstraints {
            $0.top.equalToSuperview().inset(156)
            $0.leading.equalToSuperview().inset(242)
        }
    }
    
    func bindData(data: LibraryData) {
        self.stampSpot1.image = data.libraryStamp1
        self.stampSpot2.image = data.libraryStamp2
        self.stampSpot3.image = data.libraryStamp3
        self.stampSpot4.image = data.libraryStamp4
        self.stampSpot5.image = data.libraryStamp5
        self.stampSpot6.image = data.libraryStamp6
        self.stampSpot7.image = data.libraryStamp7
        self.stampSpot8.image = data.libraryStamp8
        self.stampSpot9.image = data.libraryStamp9
        self.stampSpot10.image = data.libraryStamp10
        self.stampSpot11.image = data.libraryStamp11
        self.stampSpot12.image = data.libraryStamp12
    }
}
