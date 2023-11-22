//
//  NoteViewContoller.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit

import Then
import SnapKit

class NoteViewController: BaseViewController, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        setLayout()
//        setCollectionViewConfig()
//        setCollectionViewLayout()
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private func customNavigationBar() {
        if let navigationBar = self.navigationController?.navigationBar {
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 46))
            
            let backButton = UIButton(type: .custom)
            backButton.setTitle("노트", for: .normal)
            backButton.setImage(UIImage(named: "ic_arrow_left"), for: .normal)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
            backButton.setTitleColor(UIColor.black, for: .normal)
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            containerView.addSubview(backButton)
            
            searchController.searchBar.placeholder = "검색어를 입력하세요"
            searchController.searchBar.layer.cornerRadius = 32
            //                navigationItem.hidesSearchBarWhenScrolling = false
            containerView.addSubview(searchController.searchBar)
            
            backButton.snp.makeConstraints {
                $0.leading.equalTo(containerView.snp.leading).offset(20)
                $0.top.equalTo(containerView.snp.top).offset(21)
            }
            
            searchController.searchBar.snp.makeConstraints {
                $0.width.equalTo(210)
                $0.height.equalTo(36)
                $0.leading.equalTo(containerView.snp.leading).offset(145)
                $0.top.equalTo(containerView.snp.top).offset(18)
            }
            
            navigationItem.titleView = containerView
            navigationBar.backgroundColor = .white
            navigationBar.isTranslucent = false
        }
    }
    
//    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
//        $0.backgroundColor = .clear
//    }
//    
//    override func setLayout() {
//        self.view.addSubview(collectionView)
//        
//        collectionView.snp.makeConstraints{
//            $0.leading.trailing.equalToSuperview()
//        }
//    }
//    
//    private func setCollectionViewConfig() {
//        self.collectionView.register(FilterButtonMakeCollectionViewCell.self, forCellWithReuseIdentifier: FilterButtonMakeCollectionViewCell.identifier)
//        
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
//    }
//    
//    private func setCollectionViewLayout() {
//        let flowlayout = UICollectionViewFlowLayout()
//        self.collectionView.setCollectionViewLayout(flowlayout, animated: false)
//    }
    
    
    // TODO: 뒤로가기 버튼 동작 추가
    @objc private func backButtonTapped() {
        // 뒤로가기 버튼이 눌렸을 때 Home으로 가는 동작
    }
}


extension NoteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 28)
    }
}

extension NoteViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterButtonMakeCollectionViewCell.identifier, for: indexPath) as? FilterButtonMakeCollectionViewCell else {
            return UICollectionViewCell()
        }
        // 셀에 대한 추가 설정
        return cell
    }
}
