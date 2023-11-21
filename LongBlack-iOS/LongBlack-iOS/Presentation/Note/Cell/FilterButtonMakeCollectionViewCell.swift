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
       collectionView.showsHorizontalScrollIndicator = false
       return collectionView
   }()
    
    private func setCollectionViewConfig() {
        self.collectionView.register(FilterButtonCollectionViewCell.self, forCellWithReuseIdentifier: FilterButtonCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        setCollectionViewConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(133)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
}


extension FilterButtonMakeCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 115, height: 28)
        }
}
extension FilterButtonMakeCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterButtonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FilterButtonCollectionViewCell.identifier, for: indexPath) as? FilterButtonCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: filterButtonData[indexPath.item])
        return item
    }
}
