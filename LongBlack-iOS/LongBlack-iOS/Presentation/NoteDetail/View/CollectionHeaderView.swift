//
//  CollectionHeaderView.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/24/23.
//

import UIKit

import SnapKit
import Then

class CollectionHeaderView: UICollectionReusableView {
    
    static let identifier = "CollectionHeaderView"
    
    private lazy var contentView: UIView = {

        let view = UIView()
        view.backgroundColor = .white
        let line1 = reusedLineView(height: 4, color: .subGray1)
        let line2 = reusedLineView(height: 2, color: .subGray2)
        [stampButton, line1, line2, profileView].forEach() {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        line1.snp.makeConstraints() {
            $0.leading.trailing.top.equalTo(view).inset(20)
        }
        line2.snp.makeConstraints() {
            $0.leading.trailing.equalTo(view).inset(20)
            $0.bottom.equalTo(profileView.snp.top).offset(-46)
        }
        stampButton.snp.makeConstraints() {
            $0.trailing.equalTo(view).inset(20)
            $0.bottom.equalTo(line2.snp.top).offset(-10)
        }
        profileView.snp.makeConstraints() {
            $0.leading.equalTo(view).inset(20)
            $0.bottom.equalTo(view)
        }
        
        return view
    }()
    
    private lazy var stampButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Detail.bigStamp, for: .normal)
        button.setImage(ImageLiterals.Detail.bigCoffee, for: .selected)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button
    }()
    @objc func buttonPressed() {
        stampButton.isSelected.toggle()
    }
    
    let profileView: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.Detail.profileImg
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.snp.makeConstraints() {
            $0.height.equalTo(32)
            $0.width.equalTo(127)
        }
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    let writerLabel = UILabel()
    let dateLabel = UILabel()
    
    private func setLayout() {
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel, writerLabel, dateLabel].forEach() {
            contentView.addSubview($0)
        }
        contentView.snp.makeConstraints() {
            $0.edges.equalTo(self)
        }
        titleLabel.snp.makeConstraints() {
            $0.leading.equalTo(contentView.snp.leading).inset(20)
            $0.trailing.equalTo(contentView.snp.trailing).inset(80)
            $0.top.equalTo(contentView.snp.top).inset(30)
        }
        titleLabel.font = .h2Bold
        titleLabel.text = articledatalist[0].title
        titleLabel.numberOfLines = 0
        
        writerLabel.snp.makeConstraints() {
            $0.leading.equalTo(contentView.snp.leading).inset(20)
            $0.bottom.equalTo(contentView.snp.bottom).inset(85)
        }
        writerLabel.text = articledatalist[0].writer
        dateLabel.snp.makeConstraints() {
            $0.leading.equalTo(writerLabel).offset(50)
            $0.bottom.equalTo(contentView.snp.bottom).inset(85)
        }
        dateLabel.text = articledatalist[0].createdDate
    }
    
    func configure() {
        //addSubview(contentView)
        setLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
    }
}
