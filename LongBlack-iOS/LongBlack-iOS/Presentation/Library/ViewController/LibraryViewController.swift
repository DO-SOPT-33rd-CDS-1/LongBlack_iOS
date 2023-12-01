//
//  LibraryViewController.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

import UIKit

import SnapKit
import Then


class LibraryViewController: BaseViewController {
    
    let classifyButtonView = ClassifyButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setNeedsLayout()
        setCollectionViewLayout()
        setCollectionViewConfig()
    }
    
    override func setStyle() {
        view.backgroundColor = .white
    }
    
    override func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubviews(classifyButtonView, collectionView)
        
        classifyButtonView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(25)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(66)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 52
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(LibraryCollectionViewCell.self,
                                     forCellWithReuseIdentifier: LibraryCollectionViewCell.identifier)
        self.collectionView.register(UnExchangedStampCollectionViewCell.self,
                                     forCellWithReuseIdentifier: UnExchangedStampCollectionViewCell.identifier)
        self.collectionView.register(LibraryDescriptionCollectionViewCell.self,
                                     forCellWithReuseIdentifier: LibraryDescriptionCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}


extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.size.width, height: 410)
        } else if indexPath.section == 1 {
            return CGSize(width: collectionView.frame.size.width , height: 233)
        }
        else {
            return CGSize(width: collectionView.frame.size.width, height: 254)
        }
    }
}

extension LibraryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            // 첫 번째 섹션
            return 1
        } else if section == 1 {
            // 두 번째 섹션
            return 1
        } else {
            // 세 번째 섹션
            return 1
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LibraryCollectionViewCell.identifier, for: indexPath) as? LibraryCollectionViewCell else {return UICollectionViewCell()}
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UnExchangedStampCollectionViewCell.identifier, for: indexPath) as? UnExchangedStampCollectionViewCell else {return UICollectionViewCell()}
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LibraryDescriptionCollectionViewCell.identifier, for: indexPath) as? LibraryDescriptionCollectionViewCell else {return UICollectionViewCell()}
            return cell
            
        default:
            return UICollectionViewCell()
            
        }
    }
}

