//
//  LibraryPageTitleView.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/27/23.
//

import UIKit

class PageTitleViewController: UIViewController {
    var pageTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pageTitle = pageTitle {
            let label = UILabel()
            label.text = pageTitle
            label.textAlignment = .center
            label.font = .b3Medium
            label.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        }
    }
}


