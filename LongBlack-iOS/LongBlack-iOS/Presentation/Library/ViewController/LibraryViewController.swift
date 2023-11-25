//
//  LibraryViewController.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

import UIKit


class LibraryViewController: BaseViewController {
    
    private let customLibraryNavigationView = CustomLibraryNavigationView()
    
    override func setLayout() {
            self.navigationController?.navigationBar.isHidden = true
        }
    
    override func setStyle() {
        view.backgroundColor = .white
        self.view.addSubviews(customLibraryNavigationView)
            
        customLibraryNavigationView.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide)
                $0.horizontalEdges.equalToSuperview()
            }
        
        }


}
