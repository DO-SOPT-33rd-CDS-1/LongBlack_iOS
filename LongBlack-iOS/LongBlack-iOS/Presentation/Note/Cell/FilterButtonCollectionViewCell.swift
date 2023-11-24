//
//  FilterButtonCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit

import Then
import SnapKit

class FilterButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "FilterButtonCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        self.contentView.addSubview(filterButton)
        filterButton.addSubview(filterLabel)
        
        filterLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        filterButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private var filterButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 17
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor
    }
    
    private var filterLabel = UILabel().then {
        $0.font = .b5Mudium
        $0.textColor = .subGray1
    }
    
    func bindData(data: FilterButtonData) {
        self.filterLabel.text = data.filter
    }
}
