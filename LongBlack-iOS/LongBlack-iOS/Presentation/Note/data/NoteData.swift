//
//  NoteData.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit


struct NoteData {
    let image: String
    let title: String
    let author: String
    let divider: String
    let nickname: String
    let state: Bool
    let backgroundColor: UIColor
    
    
    init(image: String, title: String, author: String, divider: String, nickname: String, state: Bool, backgroundColor: UIColor) {
        self.image = image
        self.title = title
        self.author = author
        self.divider = divider
        self.nickname = nickname
        self.state = state
        self.backgroundColor = backgroundColor
    }
}

var noteData: [NoteData] = [
    .init(image: "image1", title: "오픈갤러리 : 내 거실이 갤러리, 미술 시장의 빈틈을 파고든 원화 구독 ···", author: "박희정", divider: "|", nickname: "P", state: true, backgroundColor: .mainMainOrange),
    .init(image: "image2", title: "무스토이 : OMG와 슈퍼해피 정신으로, 아마존 1위 장난감이 되다", author: "방민지", divider: "|", nickname: "B", state: false, backgroundColor: .subcolorGreen),
    .init(image: "image3", title: "애시드 리그 : 커피·고수·김치맛 식초, 4000개의 슈퍼마켓 매대를 꿰차다", author: "손명지", divider: "|", nickname: "S", state: false, backgroundColor: .subcolorGreen),
    .init(image: "image4", title: "조병수 : 10년 뒤 서울엔 산과 강, 바람이 있을까” 건축가가 묻다", author: "신민철", divider: "|", nickname: "S", state: true, backgroundColor: .mainPointBlue),
    .init(image: "image5", title: "코오롱스포츠 : 연 8000억 매출의 50년 아웃도어 브랜드, 오리진을 ···", author: "이연진", divider: "|", nickname: "L", state: true, backgroundColor: .mainPointBlue),
    .init(image: "image6", title: "First, Learn to practice : 조금 더 계속하는 바로 그 순간", author: "이우제", divider: "|", nickname: "L", state: true, backgroundColor: .subcolorSand),
    .init(image: "image7", title: "엄커피 : 아버지가 브라질에 뿌린 커피콩, 아들을 바리스타 챔피언으로 ···", author: "이준희", divider: "|", nickname: "L", state: false, backgroundColor: .mainPointBlue),
    .init(image: "image8", title: "아루히 : 손님과의 케미스트리로, ‘스강신청’ 오마카세 집이 되다", author: "정채은", divider: "|", nickname: "L", state: false, backgroundColor: .mainPointBlue),
    ]
