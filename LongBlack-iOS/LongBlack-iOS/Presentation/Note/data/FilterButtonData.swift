//
//  FilterButtonData.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit


struct FilterButtonData {
    let filter : String
    
    
    init(filter: String) {
        self.filter = filter
    }
}

var filterButtonData: [FilterButtonData] = [
    .init(filter: "안 읽은 노트"),
    .init(filter: "스탬프 받은 노트"),
    .init(filter: "평점 5점 준 노트"),
    .init(filter: "북마크 한 노트"),
    ]
