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
        
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6), height: 100)
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
    
    // 책갈피 꽂기, 삭제 버튼은 'setLayout()에서' 책갈피 유무에 따라 어떤 버튼을 보일지 결정하면 될듯
    private let placeBookmarkButton = UIButton().then {
        $0.setImage(UIImage(named: "placeBookmark"), for: .normal)
        $0.setImage(UIImage(named: "removeBookmark"), for: .selected)
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - collectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    // MARK: - contentView
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        let title = UILabel()
        title.font = .systemFont(ofSize: 28)
        title.text = articledatalist[0].title
        title.numberOfLines = 0
        let writer = UILabel()
        writer.text = articledatalist[0].writer
        let date = UILabel()
        date.text = articledatalist[0].createdDate

        let line1 = CustomLine(height: 4, color: .subGray1)
        let line2 = CustomLine(height: 2, color: .subGray2)
        [stampButton, title, line1, line2, writer, date].forEach() {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        line1.snp.makeConstraints() {
            $0.leading.trailing.top.equalTo(view)
        }
        line2.snp.makeConstraints() {
            $0.leading.trailing.bottom.equalTo(view)
        }
        title.snp.makeConstraints() {
            $0.leading.top.equalTo(view).inset(20)
            $0.trailing.equalTo(view).inset(80)
        }
        writer.snp.makeConstraints() {
            $0.leading.bottom.equalTo(view).inset(10)
        }
        date.snp.makeConstraints() {
            $0.leading.equalTo(writer).offset(50)
            $0.bottom.equalTo(view).inset(10)
        }
        stampButton.snp.makeConstraints() {
            $0.trailing.bottom.equalTo(view).inset(10)
        }
        
        return view
    }()
    
    // MARK: - stampButton
    private lazy var stampButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "stamp_big"), for: .normal)
        button.setImage(UIImage(named: "coffee_big"), for: .selected)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button
    }()
    @objc func buttonPressed() {
        stampButton.isSelected = !stampButton.isSelected
    }
    
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
        [topView, bottomView, contentView, collectionView].forEach() {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
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
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
                                     contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                     contentView.heightAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: contentView.bottomAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomView.topAnchor)
        ])
    }
    
    // MARK: - backButtonTapped()
    @objc private func backButtonTapped() {
         self.navigationController?.popViewController(animated: true)
    }
    
}
// MARK: - UICollectionView Extension
extension NoteDetailViewController: UICollectionViewDelegate {}
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
    
}
extension NoteDetailViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 3
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
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
