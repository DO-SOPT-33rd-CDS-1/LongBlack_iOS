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
                                                .init(content: "얼마 전 B네 집에 놀러갔는데, 거실에 못 보던 그림이 걸려있더라. 물감 결이 살아있는 걸 보니 원화였어.", paragraphType: "TEXT"),
                                                .init(content: "내가 프리즈 서울에 다녀와 봐서 알잖아. 그림이 좀 비싼 게 아니란 거. 계속 들여다보고 있으니까, B가 말해주더라. 그림 구독 서비스를 이용 중이래. 회사 이름은 오픈갤러리.", paragraphType: "TEXT"),
                                                .init(content: "원화를 구독한다니. 처음 듣는 비즈니스 모델이잖아? 그냥 넘어갈 수 없지. 박의규 오픈갤러리 대표를 만나 속속들이 물어봤어.", paragraphType: "TEXT")
                                                ]
