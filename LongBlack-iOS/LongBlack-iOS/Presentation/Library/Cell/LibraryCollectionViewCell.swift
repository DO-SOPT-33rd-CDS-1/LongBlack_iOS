//
//  LibraryCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/27/23.
//

import UIKit

import SnapKit

class LibraryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "LibraryCollectionViewCell"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var stampCardTitle: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Stamp.stampTitle
        label.textColor = .subGray1
        label.font = .b2Regular
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stampDescription: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Stamp.stampDescription
        label.textColor = .subGray2
        label.font = .b8Light
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stampBox: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.subGray5.cgColor
        return view
    }()
    
    private var stampBoxLine: UIView = {
        let line = UIView()
        line.backgroundColor = .subGray5
        line.heightAnchor.constraint(equalToConstant: 0.6).isActive = true
        return line
    }()
    
       
    
    private func setCollectionViewConfig() {
        self.collectionView.register(LibraryMakeCollectionViewCell.self, forCellWithReuseIdentifier: LibraryMakeCollectionViewCell.identifier)
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
        self.addSubview(stampBox)
        stampBox.addSubviews(stampCardTitle, stampDescription, stampBoxLine)
        collectionView.dataSource = self
        
        stampBox.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(28)
            $0.top.bottom.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(stampBoxLine.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalTo(stampBox).inset(10)
        }
        
        stampCardTitle.snp.makeConstraints {
            $0.leading.equalTo(stampBox.snp.leading).inset(20)
            $0.top.equalTo(stampBox.snp.top).inset(15)
        }
        
        stampDescription.snp.makeConstraints {
            $0.leading.equalTo(stampBox.snp.leading).inset(20)
            $0.top.equalTo(stampBox.snp.top).inset(41)
        }
        
        stampBoxLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(1)
            $0.top.equalTo(stampBox.snp.top).inset(68)
        }
    }
}


extension LibraryCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 52, height: 52)
        }
}
extension LibraryCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return libraryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: LibraryMakeCollectionViewCell.identifier, for: indexPath) as? LibraryMakeCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: libraryData[indexPath.item])
        return item
    }
}
