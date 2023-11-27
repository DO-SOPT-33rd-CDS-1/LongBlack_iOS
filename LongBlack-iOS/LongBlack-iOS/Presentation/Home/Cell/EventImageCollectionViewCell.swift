//
//  EventImageCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/24/23.
//
import UIKit

import SnapKit
import Then

final class EventImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    // MARK: Constants
    static let identifier: String = "EventImageCollectionViewCell"
    
    // MARK: Component
    let eventImageView = UIImageView()
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() { }
    
    private func setLayout() {
        self.addSubviews(eventImageView)
        
        eventImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bindEventImageData(data: UIImage) {
        eventImageView.image = data
    }
}
