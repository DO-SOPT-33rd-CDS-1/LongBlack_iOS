//
//  CollectionViewData.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/22/23.
//

import Foundation

struct CollectionViewData {
    let content: String
    let paragraphType: String
    
    init(content: String, paragraphType: String) {
        self.content = content
        self.paragraphType = paragraphType
    }
}

// dummy data
var collectionviewdata: [CollectionViewData] = []
