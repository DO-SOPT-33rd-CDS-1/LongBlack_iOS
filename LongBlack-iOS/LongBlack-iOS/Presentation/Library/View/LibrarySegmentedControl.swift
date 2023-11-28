//
//  LibrarySegmentedControl.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/29/23.
//

import UIKit

import SnapKit
import Then

final class LibrarySegmentedControl: UISegmentedControl {

    private lazy var librarySelected: UIView = {
        let width = self.bounds.size.width / CGFloat(self.numberOfSegments) * 0.8
        let height: CGFloat = 2
        let xPosition: CGFloat = 0.0
        let yPosition = self.bounds.size.height - height
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        return view
    }()
    
    private lazy var libraryDefault: UIView = {
        let width = self.bounds.size.width
        let height: CGFloat = 1
        let xPosition: CGFloat = 0.0
        let yPosition = self.bounds.size.height - height
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        removeBackgroundAndDivider()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        removeBackgroundAndDivider()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUI()
    }
}

extension LibrarySegmentedControl {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        librarySelected.do {
            $0.backgroundColor = .subGray1
        }
        
        libraryDefault.do {
            $0.backgroundColor = .subGray6
        }
    }
    
    private func setLayout() {
        self.addSubviews(
            libraryDefault,
            librarySelected
        )

        let width = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineWidth = width * 0.8
        let underlineXPosition = (width - underlineWidth) / 2 + width * CGFloat(self.selectedSegmentIndex)
        
        self.libraryDefault.frame.size.width = width * CGFloat(self.numberOfSegments)
        self.librarySelected.frame.size.width = underlineWidth

        self.libraryDefault.frame.origin.x = 0.0
        self.librarySelected.frame.origin.x = underlineXPosition

        UIView.animate(withDuration: 0.1) {
            self.layoutIfNeeded()
        }

        self.layer.cornerRadius = 0
    }

    private func removeBackgroundAndDivider() {
        let image = UIImage()
        self.setBackgroundImage(image, for: .normal, barMetrics: .default)
        self.setBackgroundImage(image, for: .selected, barMetrics: .default)
        self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        self.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }
}
