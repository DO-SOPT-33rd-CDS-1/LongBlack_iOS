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
    var paragraphType: String = "" // property 'paragraphType' not initialized in super.init()
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
        self.paragraph_original = data.content
        self.paragraphType = data.paragraphType
    }
    
    // MARK: - addBookmark() & removeBookmark()
    func addBookmark() {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "readmark")
        let imageString = NSAttributedString(attachment: imageAttachment)
        let attributedString = NSMutableAttributedString(string: paragraph.text ?? "")
        attributedString.append(imageString)
        paragraph.attributedText = attributedString
    }
    func removeBookmark() {
//        let mutableAttributedString = NSMutableAttributedString(attributedString: paragraph.attributedText ?? NSAttributedString())
//        let range = (mutableAttributedString.string as NSString).range(of: "")
//        mutableAttributedString.replaceCharacters(in: range, with: "")
//
//        // UILabel에 새로운 NSAttributedString 설정
//        paragraph.attributedText = mutableAttributedString
        paragraph.text = paragraph_original
    }
    
    // MARK: - setLayout()
    private func setLayout() {
        self.addSubviews(paragraph)
        paragraph.translatesAutoresizingMaskIntoConstraints = false
        
        switch self.paragraphType {
        case "SUBHEADING":
            // paragraph.font = UIFont(name: "", size: 18)
            paragraph.font = .systemFont(ofSize: 18)
        case "TEXT":
            paragraph.font = .systemFont(ofSize: 16)
        case "HEAD":
            paragraph.font = .systemFont(ofSize: 24)
        case "TITLE":
            paragraph.font = .systemFont(ofSize: 28)
        default:
            paragraph.font = .systemFont(ofSize: 16)
        }
        paragraph.snp.makeConstraints() {
            $0.centerY.equalTo(self)
            $0.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    lazy var paragraph: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
}
