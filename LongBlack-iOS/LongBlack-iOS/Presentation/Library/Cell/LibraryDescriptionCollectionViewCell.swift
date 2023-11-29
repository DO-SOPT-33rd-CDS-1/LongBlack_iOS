//
//  LibraryDescriptionCollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/29/23.
//

import UIKit

import SnapKit

class LibraryDescriptionCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "LibraryDescriptionCollectionViewCell"
    
    private var seperatedLine: UIView = {
        let view = UIView()
        view.backgroundColor = .subGray6
        return view
    }()
    
    private var description1: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Description.descriptionDummy1
        label.numberOfLines = 0
        label.textColor = .subGray3
        label.font = .b6Regular
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var description2: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Description.descriptionDummy2
        label.textColor = .subGray3
        label.font = .b6Regular
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var description3: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Description.descriptionDummy3
        label.numberOfLines = 0
        label.textColor = .subGray3
        label.font = .b6Regular
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var description4: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Description.descriptionDummy4
        label.textColor = .subGray3
        label.font = .b6Regular
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var description5: UILabel = {
        let label = UILabel()
        label.text = StringLiterals.Library.Description.descriptionDummy5
        label.textColor = .subGray3
        label.font = .b6Regular
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.contentView.addSubviews(seperatedLine, description1, description2, description3, description4, description5)
        
        seperatedLine.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(8)
        }
        
        description1.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(21)
            $0.top.equalTo(seperatedLine.snp.bottom).offset(28)
            $0.width.equalTo(290)
        }
        
        description2.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(21)
            $0.top.equalTo(seperatedLine.snp.bottom).offset(78)
        }
        
        description3.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(21)
            $0.top.equalTo(seperatedLine.snp.bottom).offset(109)
            $0.width.equalTo(283)
        }
        
        description4.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(21)
            $0.top.equalTo(seperatedLine.snp.bottom).offset(159)
        }
        
        description5.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(21)
            $0.top.equalTo(seperatedLine.snp.bottom).offset(190)
        }
    }  
}
