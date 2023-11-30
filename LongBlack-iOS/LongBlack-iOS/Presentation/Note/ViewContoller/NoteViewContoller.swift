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
    
    private let customNoteViewNavigationView = CustomNoteViewNavigationView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionView()
    }
    
    override func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func setStyle() {
        self.view.addSubviews(customNoteViewNavigationView, collectionView)
        
        customNoteViewNavigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(customNoteViewNavigationView.snp.bottom)
        }
        
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .white
    }
    
    private func setCollectionView() {
        self.collectionView.register(FilterButtonMakeCollectionViewCell.self,
                                     forCellWithReuseIdentifier: FilterButtonMakeCollectionViewCell.identifier)
        
        self.collectionView.register(NoteCollectionViewCell.self, forCellWithReuseIdentifier: NoteCollectionViewCell.identifier)
        
        self.collectionView.register(CustomNoteViewFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomNoteViewFooterView.identifier)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    
    
    // TODO: 뒤로가기 버튼 동작 추가
    // TODO: section0 의 버튼들 상태 변화 넣기
    // TODO: section1 detail 페이지 연결
    // TODO: 좋아요 버튼 구현
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 1:
            guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomNoteViewFooterView.identifier, for: indexPath) as? CustomNoteViewFooterView
            else {
                return UICollectionReusableView()
            }
            return footerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: collectionView.frame.width, height: 120)
        }
        else {
            return CGSize.zero
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
