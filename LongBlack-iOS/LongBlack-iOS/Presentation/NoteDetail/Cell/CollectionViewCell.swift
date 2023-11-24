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
    var paragraph_original: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.paragraph.numberOfLines = 0
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - bindData()
    func bindData(data: CollectionViewData) {
        
        self.paragraph.text = data.content
        
        // 줄 사이 간격 조정
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10 // 원하는 간격 값으로 설정
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
        ]
        let attributedString = NSAttributedString(string: paragraph.text ?? "", attributes: attributes)
        self.paragraph.attributedText = attributedString

        self.paragraph_original = data.content
        self.paragraphType = data.paragraphType
        
        switch self.paragraphType {
        case "SUBHEADING":
            paragraph.font = .h6Bold
        case "TEXT":
            paragraph.font = .b1Regular
        case "HEAD":
            paragraph.font = .h3Semibold
        case "TITLE":
            paragraph.font = .h2Bold
        default:
            paragraph.font = .systemFont(ofSize: 16)
        }
    }
    
    // MARK: - addBookmark() & removeBookmark()
    func addBookmark() {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "readmark")
        let imageString = NSAttributedString(attachment: imageAttachment)
        let originalText = paragraph.text ?? ""
        let originalString = NSAttributedString(string: originalText)
        let attributedString = NSMutableAttributedString(attributedString: originalString)
        attributedString.append(imageString)
        paragraph.attributedText = attributedString
    }
    
    // MARK: - removeBookmark()
    func removeBookmark() {
        paragraph.text = paragraph_original
        
        // 줄 간격 다시 조정
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10 // 원하는 간격 값으로 설정
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
        ]
        let attributedString = NSAttributedString(string: paragraph.text ?? "", attributes: attributes)
        self.paragraph.attributedText = attributedString
    }
    
    // MARK: - setLayout()
    private func setLayout() {
        self.addSubviews(paragraph)
        paragraph.translatesAutoresizingMaskIntoConstraints = false
        
        paragraph.snp.makeConstraints() {
            $0.centerY.equalTo(self)
            $0.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    let paragraph: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.sizeToFit()
        
        return label
    }()
    
    func calculateLabelHeight() -> CGFloat {
        let labelWidth = UIScreen.main.bounds.width - 20 // 예시로 너비를 화면 전체에서 20을 뺀 값으로 설정
        let size = CGSize(width: labelWidth, height: .greatestFiniteMagnitude)
        let boundingBox = paragraph.text?.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: paragraph.font!], context: nil)
        return boundingBox?.height ?? 0
    }
}
