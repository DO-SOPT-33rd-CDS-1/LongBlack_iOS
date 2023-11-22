//
//  NoteCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "NoteCollectionViewCell"
    
    private var itemRow: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
    }
    
    private var image: UIImage?
    private var title = UILabel().then {
        $0.font = .h5Semibold
        $0.textColor = .black
    }
    
    private var author = UILabel().then {
        $0.font = .b3Medium
        $0.textColor = .black
    }
    
    private var divider = UILabel().then {
        $0.textColor = .subGray3
    }
    
    private var nickname = UILabel().then {
        $0.font = .b3Medium
        $0.textColor = .black
    }
    
    private var state: UIImage?
    
    private var background = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 335, height: 139)
    }
    
    func bindData(data: NoteData) {
        self.image = UIImage(named: data.image)
        self.title.text = data.title
        self.author.text = data.author
        self.divider.text = data.divider
        self.nickname.text = data.nickname
        if data.state {
                self.state = UIImage(named: "ic_arrow_left")
            } else {
                self.state = UIImage(named: "ic_search")
            }
        //아직 에셋 추가 안해서 임시이미지로 넣어줌
        self.background.backgroundColor = UIColor(named: data.backgroundColor)
    }
}
