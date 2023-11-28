//
//  UnExchangedStampCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/29/23.
//

import UIKit

class UnExchangedStampCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "UnExchangedStampCollectionViewCell"
    
    private var cardTitle: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Card.cardTitle
        label.textColor = .subGray1
        label.font = .b2Regular
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var cardName: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Card.cardName
        label.textColor = .subGray2
        label.font = .b3Medium
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var cardDate: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Card.cardDate
        label.textColor = .subGray3
        label.font = .b6Regular
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cardExchangeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(StringLiterals.Library.Card.cardExchangeButton, for: .normal)
        button.titleLabel?.font = .b3Medium
        button.setTitleColor(.subGray1, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderColor = UIColor.subGray4.cgColor
        return button
    }()
    
    private let libraryCoffeCard: UIImageView = {
        let image = UIImageView(image: ImageLiterals.Library.imgLibraryCoffeCard)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.contentView.addSubviews(cardTitle, libraryCoffeCard)
        libraryCoffeCard.addSubviews(cardName, cardDate, cardExchangeButton)
        
        cardTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(29)
            $0.top.equalToSuperview()
        }
        
        libraryCoffeCard.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27)
            $0.top.equalTo(cardTitle.snp.bottom).inset(16)
        }
        
        cardName.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(120)
            $0.top.equalToSuperview().inset(25)
        }
        
        cardDate.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(120)
            $0.top.equalToSuperview().inset(45)
        }
        
        cardExchangeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(219)
            $0.top.equalToSuperview().inset(28)
        }
    }
}
