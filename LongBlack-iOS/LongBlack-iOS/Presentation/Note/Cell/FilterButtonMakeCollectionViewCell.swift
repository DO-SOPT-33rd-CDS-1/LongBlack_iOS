//
//  FilterButtonMakeCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit

import Then
import SnapKit

class FilterButtonMakeCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    static let identifier: String = "FilterButtonMakeCollectionViewCell"
    
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       collectionView.backgroundColor = .clear
       collectionView.showsHorizontalScrollIndicator = true
       return collectionView
   }()
    
    private func setCollectionViewConfig() {
        self.collectionView.register(FilterButtonCollectionViewCell.self, forCellWithReuseIdentifier: FilterButtonCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .systemBlue
        self.setLayout()
        self.setCollectionViewConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.top.bottom.equalToSuperview()
        }
    }
}


extension FilterButtonMakeCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 93, height: 28)
        }
    
    // TODO: cell 간격 띄우기 (간격 8) 우선 이 아랫놈은 기능을 못함 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
}

extension FilterButtonMakeCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return filterButtonData.count
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FilterButtonCollectionViewCell.identifier, for: indexPath) as? FilterButtonCollectionViewCell else { return UICollectionViewCell() }
//        item.bindData(data: filterButtonData[indexPath.item])
        return item
    }
}
