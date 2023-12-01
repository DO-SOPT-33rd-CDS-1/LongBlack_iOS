//
//  NoteCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit

import Then
import SnapKit

class NoteCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "NoteCollectionViewCell"
    
    private var itemRow: Int?
    private var isListView: Bool = false

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var noteDivider = UILabel().then {
        $0.font = .b3Medium
        $0.text = "|"
        $0.textColor = .subGray3
    }
    
    private func setLayout() {
        self.addSubview(contentView)
        contentView.addSubviews(noteBackground, noteImage, noteTitle, noteAuthor, noteDivider, noteNickname, noteState)
        
        noteImage.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(200)
        }
        
        noteBackground.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().offset(5)
            $0.leading.trailing.equalToSuperview()
        }
        
        noteTitle.snp.makeConstraints {
            $0.leading.equalTo(noteImage.snp.leading).offset(26)
            $0.trailing.equalTo(noteImage.snp.trailing).offset(-35)
            $0.top.equalTo(noteImage.snp.bottom).offset(21)
        }
        
        noteAuthor.snp.makeConstraints {
            $0.leading.equalTo(noteImage.snp.leading).offset(26)
            $0.top.equalTo(noteTitle.snp.bottom).offset(20)
        }
        
        noteDivider.snp.makeConstraints {
            $0.leading.equalTo(noteAuthor.snp.trailing).offset(11)
            $0.top.equalTo(noteTitle.snp.bottom).offset(20)
        }
        
        noteNickname.snp.makeConstraints {
            $0.leading.equalTo(noteDivider.snp.trailing).offset(11)
            $0.top.equalTo(noteTitle.snp.bottom).offset(20)
        }
        
        noteState.snp.makeConstraints {
            $0.leading.equalTo(noteImage.snp.leading).offset(277)
            $0.top.equalTo(noteImage.snp.top).offset(10)
            $0.width.height.equalTo(40)
        }
    }
    
    private var noteId: Int = 0
    
    private var noteImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private var noteTitle = UILabel().then {
        $0.font = .h5Semibold
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    private var noteAuthor = UILabel().then {
        $0.font = .b3Medium
        $0.textColor = .black
    }
    
    private var noteNickname = UILabel().then {
        $0.font = .b3Medium
        $0.textColor = .black
    }
    
    private lazy var noteState = UIImageView().then {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(noteStateTapped))
            $0.addGestureRecognizer(tapGesture)
        }
    
    private var noteBackground = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 335, height: 339)
        $0.layer.cornerRadius = 4
    }
    
    func bindData(data: NoteData, imageData: NoteImageData) {
        self.noteId = data.id
        self.noteTitle.text = data.title
        self.noteAuthor.text = data.author
        print("bind data: \(data.state)")
        if data.state {
            self.noteState.image = ImageLiterals.Note.icLike
        } else {
            self.noteState.image = ImageLiterals.Note.icUnLike
        }
        self.noteNickname.text = data.nickname
        self.noteBackground.backgroundColor = data.backgroundColor
        self.noteImage.image = imageData.image
        }
    
    @objc private func noteStateTapped() {
        print("좋아요 버튼이 탭되었습니다.")
        if self.noteState.image == ImageLiterals.Note.icLike {
            self.noteState.image = ImageLiterals.Note.icUnLike
        }
        else {
            self.noteState.image = ImageLiterals.Note.icLike
        }
        
        Task {
            do {
                try await NoteViewService.shared.updateNote(postId: Int64(noteId), isListView: true)
            } catch {
                print("PUT 요청 중 에러 발생: \(error)")
            }
        }
    }
}


