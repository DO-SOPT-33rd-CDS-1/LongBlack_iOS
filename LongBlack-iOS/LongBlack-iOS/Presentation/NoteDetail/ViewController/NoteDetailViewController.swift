//
//  NoteDetailViewController.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

import UIKit

import SnapKit
import Then

// MARK: - NoteDetailViewController
class NoteDetailViewController: BaseViewController {
    
    var cellIdx: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setCollectionViewConfig()
        setCollectionViewLayout()
        setUI()
        Task {
            print("Before fetching article info")
            await fetchArticleInfo()
            print("After fetching article info")
        }
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
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6), height: 200)
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    // MARK: - fetchArticleInfo()
    private func fetchArticleInfo() async {
        do {
            guard let currentarticle = try await GetSinglepost.shared.getArticledata(postid: 1) else {
                print("Error: currentarticle is nil")
                return
            }
            let articleinfo = ArticleData(isLiked: currentarticle.like, isStamped: currentarticle.stamp, title: currentarticle.title, postId: currentarticle.postID, writer: currentarticle.writer, createdDate: currentarticle.createdDate, bookmarkIdx: currentarticle.bookmarkIdx, paragraph: currentarticle.paragraphs)
            
            articledatalist.append(articleinfo)
            if currentarticle.like == true {
                bookmarkButton.isSelected = true
            }
        } catch {
            print("Error fetching article data:", error)
        }
        collectionView.reloadData()
    }
    // MARK: - backButton
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - bookmarkButton
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Detail.bookMark, for: .normal)
        button.setImage(ImageLiterals.Detail.bookMarkFill, for: .selected)
        button.addTarget(self, action: #selector(buttonPressed1), for: .touchUpInside)

        return button
    }()
    @objc func buttonPressed1() {
        bookmarkButton.isSelected.toggle()
        Task {
            do {
                try await NoteViewService.shared.updateNote(postId: 1, isListView: false)
            } catch {
                print(error)
            }
        }
    }
    
    let topView = UIView()
    let bottomView: UIView = {
        let view = UIView()
        let back = UIButton()
        back.setImage(ImageLiterals.Home.icArrowLeft, for: .normal)
        let foward = UIButton()
        foward.setImage(ImageLiterals.Home.icArrowRight, for: .normal)
        [back, foward].forEach() {
            view.addSubview($0)
        }
        foward.snp.makeConstraints() {
            $0.trailing.equalTo(view).inset(20)
            $0.top.equalTo(view).inset(10)
        }
        back.snp.makeConstraints() {
            $0.trailing.equalTo(foward.snp.leading).inset(-60)
            $0.top.equalTo(view).inset(10)
        }
        return view
    }()
    
    // MARK: - opaqueView
    // 책갈피 버튼 누르면 나타나는 불투명한 뷰
    let opaqueView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.black.cgColor
        view.layer.opacity = 0.45
        view.isUserInteractionEnabled = false
        return view
    }()
    
    // MARK: - placeBookmarkButton
    lazy var placeBookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Detail.placeBookmark, for: .normal)
        button.setImage(ImageLiterals.Detail.removeBookmark, for: .selected)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(bookmarkbuttonPressed), for: .touchUpInside)
        return button
    }()
    @objc func bookmarkbuttonPressed() {
        if opaqueView.isHidden {
            if !placeBookmarkButton.isSelected {
                opaqueView.isHidden = false
                collectionView.visibleCells.forEach { cell in
                    if let yourCustomCell = cell as? CollectionViewCell {
                        yourCustomCell.isUserInteractionEnabled = true
                    }
                }
            } else {
                placeBookmarkButton.isSelected.toggle()
                collectionView.visibleCells.forEach { cell in
                    if let yourCustomCell = cell as? CollectionViewCell {
                        yourCustomCell.removeBookmark()
                    }
                }
                Task {
                    do {
                        try await DeleteBookmark.shared.DeleteBookmarkFunc(postid: 1)
                    } catch {
                        print(error)
                    }
                }

            }
        } else {
            opaqueView.isHidden = true
        }
    }
    
    // MARK: - collectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionview
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
            $0.layer.cornerRadius = 0
            $0.layer.borderWidth = 0
        }
        placeBookmarkButton.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(33)
            $0.width.equalTo(96)
        }
        collectionView.snp.makeConstraints() {
            $0.leading.trailing.equalTo(self.view)
            $0.top.equalTo(topView.snp.bottom)
            $0.bottom.equalTo(bottomView.snp.top)
        }
        opaqueView.snp.makeConstraints() {
            $0.leading.trailing.equalTo(self.view)
            $0.top.equalTo(topView.snp.bottom)
            $0.bottom.equalTo(collectionView.snp.bottom)
        }
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
                    placeBookmarkButton.isSelected.toggle()
                    opaqueView.isHidden = true
                    cell.addBookmark()
                    
                    Task {
                        do {
                            try await AddBookmark.shared.PostAddBookmark(bookmarkIdx: indexPath.row)
                            cell.addBookmark()
                        } catch {
                            print("Error in PostAddBookmark:", error)
                        }
                    }
                }
            }
    }
}
// MARK: - UICollectionViewDataSource+
extension NoteDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articledatalist.first?.paraGraphs.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier,
                                                            for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: articledatalist[0].paraGraphs[indexPath.row])
        // 책갈피가 기존에 이미 있을때, 꽂혀있는 상태를 유지하게 함
        if articledatalist[0].bookmarkIdx != -1 {
            item.addBookmark()
            bookmarkButton.isSelected = true
        }
        return item
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width-6, height: 330)
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
        Task {
            await fetchArticleInfo()
            header.dataBindHeader()
            header.configure()
        }
        return header
    }
    
}
// MARK: - reusedLineView Class
class reusedLineView: UIView {
    
    var customHeight: CGFloat
    var customColor: UIColor
    
    init(height: CGFloat, color: UIColor) {
        customHeight = height
        customColor = color
        super.init(frame: .zero)
        backgroundColor = customColor
        NSLayoutConstraint.activate([self.heightAnchor.constraint(equalToConstant: height)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
