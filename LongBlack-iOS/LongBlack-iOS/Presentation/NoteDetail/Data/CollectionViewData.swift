//
//  CollectionViewData.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/22/23.
//

import Foundation

// MARK: - CollectionViewData
// 아티클의 본문, 제목을 담는 데이터
struct CollectionViewData {
    let content: String
    let paragraphType: String
    
    init(content: String, paragraphType: String) {
        self.content = content
        self.paragraphType = paragraphType
    }
}

// dummy data
var collectionviewdata: [CollectionViewData] = [.init(content: "롱블랙 프렌즈 L", paragraphType: "SUBHEADING"),
                                                .init(content: "얼마 전 B네 집에 놀러갔는데, 거실에 못 보던 그림이 걸려있더라. 물감 결이 살아있는 걸 보니 원화였어.", paragraphType: "TEXT")
                                                ]
