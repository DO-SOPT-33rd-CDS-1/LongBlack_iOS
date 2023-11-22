//
//  CollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/22/23.
//

import UIKit

import SnapKit
import Then

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - bindData()
    func bindData(data: CollectionViewData) {
        self.paragraph.text = data.content
    }
    
    // MARK: - setLayout()
    private func setLayout() {
        
    }
    
    let paragraph: UILabel = {
        let label = UILabel()
        return label
    }()
}
