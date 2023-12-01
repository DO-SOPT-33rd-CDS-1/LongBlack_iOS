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
        Task{
            await fetchList()
        }
        setLayout()
        setCollectionView()
    }
    
    override func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func setStyle() {
        self.view.addSubviews(customNoteViewNavigationView, collectionView)
        customNoteViewNavigationView.addSubview(noteViewbackButton)
        
        customNoteViewNavigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        noteViewbackButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(21)
        }
        
        collectionView.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(customNoteViewNavigationView.snp.bottom)
        }
        
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .white
    }
    
    private let noteViewbackButton = UIButton().then {
        $0.setTitle(StringLiterals.Note.TabBar.noteViewTitle, for: .normal)
        $0.setImage(ImageLiterals.Note.icNoteBackButton, for: .normal)
        $0.titleLabel?.font = .h3Semibold
        $0.setTitleColor(.subGray1, for: .normal)
        $0.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }
    
    @objc func dismissButtonTapped() {
            dismiss(animated: true, completion: nil)
        }
    
  
    private func setCollectionView() {
        self.collectionView.register(FilterButtonMakeCollectionViewCell.self,
                                     forCellWithReuseIdentifier: FilterButtonMakeCollectionViewCell.identifier)
        
        self.collectionView.register(NoteCollectionViewCell.self, forCellWithReuseIdentifier: NoteCollectionViewCell.identifier)
        
        self.collectionView.register(CustomNoteViewFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomNoteViewFooterView.identifier)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    
    func fetchList() async {
        for id in 1...1 {
            do {
                let noteId = try await NoteViewService.shared.getNoteList(post: id)
                for post in noteId.posts {
                    let noteList: NoteData = NoteData(
                        id: post.id,
                        title: post.title,
                        author: post.writer,
                        nickname: post.postType,
                        state: post.like,
                        backgroundColor: UIColor(hex: post.color)
                    )
                    noteData.append(noteList)
                }
            }
            catch {
                print("노트 리스트를 가져오는 중 오류 발생: \(error)")
            }
        }
        collectionView.reloadData()
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
            item.bindData(data: noteData[indexPath.row], imageData: noteImageData[indexPath.row])
            return item
            
        default:
            return UICollectionViewCell()
        }
    }
}


extension NoteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            // Section 1의 첫 번째 셀이 클릭된 경우
            navigateToDetailViewController()
        }
    }
    private func navigateToDetailViewController() {
        let detailViewController = NoteDetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

