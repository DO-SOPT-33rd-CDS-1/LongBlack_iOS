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
    
    let libraryStampCount: Int = 2


    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var stampTitle: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Stamp.stampTitle
        label.textColor = .subGray1
        label.font = .h7Semibold
        return label
    }()
    
    private var stampCardTitle: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Stamp.stampCardTitle
        label.textColor = .subGray1
        label.font = .b2Regular
        return label
    }()
    
    private var stampDescription: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Stamp.stampDescription
        label.textColor = .subGray2
        label.font = .b8Light
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
    
    private var stampCardButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .subGray5
        button.layer.cornerRadius = 8
        button.setTitle(StringLiterals.Library.Stamp.exchangeButton, for: .normal)
        button.titleLabel?.font = .b3Medium
        button.setTitleColor(.subGray4, for: .normal)
        return button
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
        self.addSubviews(stampTitle, stampBox, stampCardButton)
        stampBox.addSubviews(collectionView, stampCardTitle, stampDescription, stampBoxLine)
        
        stampTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(29)
            $0.top.equalToSuperview()
        }
        
        stampBox.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(28)
            $0.top.equalTo(stampTitle.snp.bottom).offset(12)
            $0.height.equalTo(352)
        }
        
        stampCardButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(28)
            $0.top.equalTo(stampBox.snp.bottom).inset(44)
            $0.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(stampBoxLine.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(stampBox).inset(26)
            $0.bottom.equalTo(stampBox.snp.bottom).inset(76)
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
        // 계산된 각 항목의 크기를 반환
        return CGSize(width: 52, height: 52)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
}





extension LibraryCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4 * 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LibraryMakeCollectionViewCell.identifier, for: indexPath) as? LibraryMakeCollectionViewCell else { return UICollectionViewCell() }

        let stampIndex = indexPath.row
        if stampIndex < libraryStampCount {
            // 사용자가 획득한 스탬프가 있을 경우
            let stamp = libraryStampCount
            cell.bindData()
        } else {
            // 사용자가 획득하지 않은 스탬프일 경우
            cell.bindDefaultData()
        }

        return cell
    }
}

