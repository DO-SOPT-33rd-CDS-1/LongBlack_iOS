//
//  CollectionHeaderView.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/24/23.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    static let identifier = "CollectionHeaderView"
    
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
        [stampButton, title, line1, line2, writer, date, profileView].forEach() {
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
        title.snp.makeConstraints() {
            $0.leading.equalTo(view).inset(20)
            $0.trailing.equalTo(view).inset(80)
            $0.top.equalTo(line1).inset(20)
        }
        writer.snp.makeConstraints() {
            $0.leading.equalTo(view).inset(20)
            $0.bottom.equalTo(line2).inset(10)
        }
        date.snp.makeConstraints() {
            $0.leading.equalTo(writer).offset(50)
            $0.bottom.equalTo(line2).inset(10)
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
        button.setImage(UIImage(named: "stamp_big"), for: .normal)
        button.setImage(UIImage(named: "coffee_big"), for: .selected)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button
    }()
    @objc func buttonPressed() {
        stampButton.isSelected = !stampButton.isSelected
    }
    
    let profileView: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "img_profile")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([image.heightAnchor.constraint(equalToConstant: 32),
                                     image.widthAnchor.constraint(equalToConstant: 127)
        ])
        return image
    }()
    
    func configure() {
        addSubview(contentView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
    }
}
