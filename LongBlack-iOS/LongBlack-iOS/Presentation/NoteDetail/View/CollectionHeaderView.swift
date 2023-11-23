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
    
    func configure() {
        // backgroundColor = .systemGreen
        addSubview(contentView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
    }
}
