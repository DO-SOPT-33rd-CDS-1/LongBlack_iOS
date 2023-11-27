//
//  CollectionViewCell.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/22/23.
//

import UIKit

import SnapKit
import Then

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CollectionViewCell"
    var paragraphType: String = ""
    var paragraphOriginal: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - bindData()
    func bindData(data: CollectionViewData) {
        
        self.paragraphLabel.text = data.content
        paragraphLabel.setTextWithLineHeight(text: paragraphLabel.text, lineHeight: 30, numberOfLines: 0)
        paragraphLabel.textAlignment = .left
        self.paragraphOriginal = data.content
        self.paragraphType = data.paragraphType
        
        switch self.paragraphType {
        case "SUBHEADING":
            paragraphLabel.font = .h6Bold
        case "TEXT":
            paragraphLabel.font = .b1Regular
        case "HEAD":
            paragraphLabel.font = .h3Semibold
        case "TITLE":
            paragraphLabel.font = .h2Bold
        default:
            paragraphLabel.font = .systemFont(ofSize: 16)
        }
    }
    
    // MARK: - addBookmark()
    func addBookmark() {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = ImageLiterals.Detail.readMark
        let imageString = NSAttributedString(attachment: imageAttachment)
        let originalText = paragraphLabel.text ?? ""
        let originalString = NSAttributedString(string: originalText)
        let attributedString = NSMutableAttributedString(attributedString: originalString)
        attributedString.append(imageString)
        paragraphLabel.attributedText = attributedString
    }
    
    // MARK: - removeBookmark()
    func removeBookmark() {
        paragraphLabel.text = paragraphOriginal
        paragraphLabel.setTextWithLineHeight(text: paragraphLabel.text, lineHeight: 30, numberOfLines: 0)
        paragraphLabel.textAlignment = .left
    }
    
    // MARK: - setLayout()
    private func setLayout() {
        self.addSubviews(paragraphLabel)
        
        paragraphLabel.snp.makeConstraints() {
            $0.centerY.equalTo(self)
            $0.leading.trailing.equalTo(self).inset(20)
        }
        
    }
    
    let paragraphLabel: UILabel = {
        
        let label = UILabel()
        label.setTextWithLineHeight(text: label.text, lineHeight: 30, numberOfLines: 0)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        
        return label
    }()
    
    func calculateLabelHeight() -> CGFloat {
        let labelWidth = UIScreen.main.bounds.width - 20 // 예시로 너비를 화면 전체에서 20을 뺀 값으로 설정
        let size = CGSize(width: labelWidth, height: .greatestFiniteMagnitude)
        let boundingBox = paragraphLabel.text?.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: paragraphLabel.font!], context: nil)
        return boundingBox?.height ?? 0
    }
}
