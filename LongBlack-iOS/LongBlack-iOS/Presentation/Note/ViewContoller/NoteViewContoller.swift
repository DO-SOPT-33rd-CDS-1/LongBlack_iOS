//
//  NoteViewContoller.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit

import Then
import SnapKit

class NoteViewController: BaseViewController {
    
    private let customNavigationView = CustomNavigationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func setStyle() {
        self.view.addSubview(customNavigationView)
        self.view.addSubview(collectionView)
        
        customNavigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(customNavigationView.snp.bottom)
        }
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .white
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(FilterButtonMakeCollectionViewCell.self,
                                     forCellWithReuseIdentifier: FilterButtonMakeCollectionViewCell.identifier)
        
        self.collectionView.register(NoteCollectionViewCell.self, forCellWithReuseIdentifier: NoteCollectionViewCell.identifier)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowlayout = UICollectionViewFlowLayout()
        self.collectionView.setCollectionViewLayout(flowlayout, animated: false)
    }
    
    // TODO: 뒤로가기 버튼 동작 추가
    @objc private func backButtonTapped() {
        // 뒤로가기 버튼이 눌렸을 때 Home으로 가는 동작
    }
}

extension NoteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            // 첫 번째 섹션 : filterButton
            return CGSize(width: collectionView.frame.width, height: 28)
        } else {
            // 두번째 섹션 : NoteView
            return CGSize(width: 335 , height: 339)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            // 첫 번째 섹션 : filterButton
         return UIEdgeInsets(top: 15, left: 20, bottom: 39, right: 0)
        } else {
        return UIEdgeInsets(top: 0, left: 20, bottom: 21, right: 20)
          
        }
    }
}


extension NoteViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return noteData.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FilterButtonMakeCollectionViewCell.identifier, for: indexPath) as? FilterButtonMakeCollectionViewCell else {return UICollectionViewCell()}
            return item
            
        case 1:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCollectionViewCell.identifier, for: indexPath) as? NoteCollectionViewCell else {return UICollectionViewCell()}
            item.bindData(data: noteData[indexPath.row])
            return item
            
        default:
            return UICollectionViewCell()
            
        }
    }
}
