//
//  NoteDetailViewController.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

import UIKit

import SnapKit
import Then

// MARK: - NoteDetailViewController class
class NoteDetailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NoteDetailViewController"
        setCollectionViewConfig()
        setCollectionViewLayout()
        setUI()
    }
    
    // MARK: - setCollectionViewConfig()
    private func setCollectionViewConfig() {
        self.collectionView.register(CollectionViewCell.self,
                                         forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    // MARK: - setCollectionViewLayout()
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        // flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        flowLayout.scrollDirection = .vertical
        
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6), height: 80)
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(button, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - bookmarkButton
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icBookmark"), for: .normal)
        button.setImage(UIImage(named: "icBookmarkFill"), for: .selected)
        button.addTarget(self, action: #selector(buttonPressed1), for: .touchUpInside)

        return button
    }()
    @objc func buttonPressed1() {
        bookmarkButton.isSelected = !bookmarkButton.isSelected
    }
    
    let topView = UIView()
    let bottomView = UIView()
    // MARK: - opaqueView
    // 책갈피 버튼 누르면 나타나는 불투명한 뷰
    let opaqueView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.black.cgColor
        view.layer.opacity = 0.5
        view.isUserInteractionEnabled = false
        return view
    }()
    let profileView: UIView = {
        let view = UIView()
        let image = UIImageView()
        image.image = UIImage(named: "img_profile")
        image.contentMode = .scaleAspectFit
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        return view
    }()
    // let scrollview = UIScrollView()
    
    // MARK: - placeBookmarkButton
    private let placeBookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "placeBookmark"), for: .normal)
        button.setImage(UIImage(named: "removeBookmark"), for: .selected)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(bookmarkbuttonPressed), for: .touchUpInside)
        return button
    }()
    @objc func bookmarkbuttonPressed() {
        if opaqueView.isHidden {
            // 검은 화면이 숨겨져 있을 때
            opaqueView.isHidden = false
            collectionView.visibleCells.forEach { cell in
                if let yourCustomCell = cell as? CollectionViewCell {
                    yourCustomCell.isUserInteractionEnabled = true
                }
                
            }
        } else {
            // 검은 화면이 보이고 있을 때
            opaqueView.isHidden = true
        }
    }
    
    // MARK: - collectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    // MARK: - setStyle()
    override func setStyle() {
        self.view.backgroundColor = .white
        placeBookmarkButton.layer.cornerRadius = 23
        placeBookmarkButton.layer.borderColor = UIColor.subGray5.cgColor
        placeBookmarkButton.layer.borderWidth = 1
        
        topView.backgroundColor = .subGray1
        bottomView.backgroundColor = .white
        backButton.tintColor = .white
        bookmarkButton.tintColor = .white
    }
    
    // MARK: - setLayout()
    override func setLayout() {
        [topView, bottomView, collectionView, opaqueView].forEach() {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        self.view.bringSubviewToFront(bottomView)
        topView.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        bottomView.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(53)
        }
        [backButton, bookmarkButton].forEach() {
            topView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        backButton.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        bookmarkButton.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
        [placeBookmarkButton].forEach() {
            bottomView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        placeBookmarkButton.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.leading.top.equalToSuperview().offset(10)
            $0.height.equalTo(33)
            $0.width.equalTo(96)
        }
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomView.topAnchor)
        ])
        NSLayoutConstraint.activate([opaqueView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     opaqueView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     opaqueView.topAnchor.constraint(equalTo: topView.bottomAnchor),
                                     opaqueView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
                                     ])
        opaqueView.isHidden = true
    }
    
    // MARK: - backButtonTapped()
    @objc private func backButtonTapped() {
         self.navigationController?.popViewController(animated: true)
    }
    
}
// MARK: - UICollectionViewDelegate+
extension NoteDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // 선택된 셀에 대한 이벤트 진행
            if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
                if opaqueView.isHidden == false {
                    cell.contentView.backgroundColor = UIColor.red
                    placeBookmarkButton.isSelected = !placeBookmarkButton.isSelected
                    opaqueView.isHidden = true
                }
            }
    }
}
// MARK: - UICollectionViewDataSource+
extension NoteDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionviewdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier,
                                                            for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: collectionviewdata[indexPath.row])
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width-6, height: 300)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout+
extension NoteDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView else {
                    return CollectionHeaderView()
                }
                header.configure()
                return header
        }
    
}

// MARK: - CustomLine Class
class CustomLine: UIView {
    
    var customHeight: CGFloat
    var customColor: UIColor

    init(height: CGFloat, color: UIColor) {
        customHeight = height
        customColor = color
        // let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: customHeight)
        super.init(frame: .zero)
        backgroundColor = customColor
        NSLayoutConstraint.activate([self.heightAnchor.constraint(equalToConstant: height)])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
