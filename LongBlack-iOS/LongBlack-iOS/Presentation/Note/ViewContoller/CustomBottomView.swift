//
//  CustomBottomView.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/23/23.
//

import UIKit

import Then
import SnapKit

class CustomBottomView: UIView {
    
    private var pageNumber = UIImageView().then {
        $0.image = UIImage(named: "number")
        $0.contentMode = .scaleAspectFit
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
        self.backgroundColor = .white
    }

    private func setupConstraints() {
        
        self.addSubview(pageNumber)
        
        self.snp.makeConstraints {
            $0.height.equalTo(120)
        }
        
        pageNumber.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36)
            $0.leading.trailing.equalToSuperview().inset(52)
        }
    }
}
