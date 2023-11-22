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
        self.contentView.addSubview(button)
        button.addSubview(filter)
        
        filter.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(6)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private var button = UIButton().then {
        $0.backgroundColor = .black
//        $0.setTitle("test", for: .normal)
        $0.layer.cornerRadius = 20
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
