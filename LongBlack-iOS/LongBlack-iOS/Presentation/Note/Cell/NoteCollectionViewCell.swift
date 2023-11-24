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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubview(contentView)
        contentView.addSubviews(background, image, title, author, divider, nickname, state)
        
        image.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(200)
        }
        
        background.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().offset(5)
            $0.leading.trailing.equalToSuperview()
        }
        
        title.snp.makeConstraints {
            $0.leading.equalTo(image.snp.leading).offset(26)
            $0.trailing.equalTo(image.snp.trailing).offset(-35)
            $0.top.equalTo(image.snp.bottom).offset(21)
        }
        
        author.snp.makeConstraints {
            $0.leading.equalTo(image.snp.leading).offset(26)
            $0.top.equalTo(title.snp.bottom).offset(20)
        }
        
        divider.snp.makeConstraints {
            $0.leading.equalTo(author.snp.trailing).offset(11)
            $0.top.equalTo(title.snp.bottom).offset(20)
        }
        
        nickname.snp.makeConstraints {
            $0.leading.equalTo(divider.snp.trailing).offset(11)
            $0.top.equalTo(title.snp.bottom).offset(20)
        }
        
        state.snp.makeConstraints {
            $0.leading.equalTo(image.snp.leading).offset(277)
            $0.top.equalTo(image.snp.top).offset(10)
            $0.width.height.equalTo(40)
        }
    }
    
    private var image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private var title = UILabel().then {
        $0.font = .h5Semibold
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    private var author = UILabel().then {
        $0.font = .b3Medium
        $0.textColor = .black
    }
    
    private var divider = UILabel().then {
        $0.font = .b3Medium
        $0.textColor = .subGray3
    }
    
    private var nickname = UILabel().then {
        $0.font = .b3Medium
        $0.textColor = .black
    }
    
    private var state = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private var background = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 335, height: 339)
        $0.layer.cornerRadius = 4
    }
    
    func bindData(data: NoteData) {
        self.image.image = data.image
        self.title.text = data.title
        self.author.text = data.author
        self.divider.text = data.divider
        self.nickname.text = data.nickname
        if data.state {
            self.state.image = UIImage(named: "likeOn")
        } else {
            self.state.image = UIImage(named: "likeOff")
        }
        self.background.backgroundColor = data.backgroundColor
    }
}
