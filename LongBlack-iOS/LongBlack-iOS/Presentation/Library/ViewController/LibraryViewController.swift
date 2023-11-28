//
//  LibraryViewController.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

import UIKit

import SnapKit


class LibraryViewController: BaseViewController {
    
    let classifyButtonView = ClassifyButtonView()
    
    override func setStyle() {
        view.backgroundColor = .white
        self.view.addSubviews(classifyButtonView)
        }
    
    override func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
        
        classifyButtonView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(25)
        }
        }
}
