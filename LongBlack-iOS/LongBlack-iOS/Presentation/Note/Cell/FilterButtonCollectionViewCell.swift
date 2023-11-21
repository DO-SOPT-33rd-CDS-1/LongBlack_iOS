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
        self.addSubviews(button, filter)
        
        filter.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(6)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
    }
    
    private var button = UIButton().then {
        $0.backgroundColor = .clear
        $0.frame = CGRect(x: 0, y: 0, width: 115, height: 28)
        $0.layer.cornerRadius = 43
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor
    }
    
    private var filter = UILabel().then {
        $0.font = .b5Mudium
        $0.textColor = .black
    }
    
    func bindData(data: FilterButtonData) {
        self.filter.text = data.filter
    }
}
