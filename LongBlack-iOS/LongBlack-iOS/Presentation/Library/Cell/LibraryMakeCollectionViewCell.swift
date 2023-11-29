//
//  LibraryMakeCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/29/23.
//

import UIKit

class LibraryMakeCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "LibraryMakeCollectionViewCell"

    private var stampImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        addSubview(stampImageView)

        stampImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func bindData() {
        // 획득한 스탬프의 이미지
        stampImageView.image = ImageLiterals.Library.imgStickerSmallFill
    }

    func bindDefaultData() {
        // 획득하지 않은 스탬프의 기본 이미지
        stampImageView.image = ImageLiterals.Library.imgStickerSmallEmpty
    }
}

