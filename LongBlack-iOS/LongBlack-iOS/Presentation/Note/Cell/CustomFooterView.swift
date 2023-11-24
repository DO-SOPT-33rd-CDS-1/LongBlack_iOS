//
//  CustomBottomView.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/23/23.
//

import UIKit

import Then
import SnapKit


class CustomFooterView: UICollectionReusableView {
    
    static let identifier = "CustomFooterView"

    private let footerFrameView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private var pageNumber = UIImageView().then {
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
        footerFrameView.addSubview(pageNumber)
        
        footerFrameView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageNumber.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36)
            $0.leading.equalToSuperview().offset(73)
        }
    }
}
