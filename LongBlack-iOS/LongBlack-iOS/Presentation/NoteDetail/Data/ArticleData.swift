//
//  ArticleData.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/23/23.
//

import Foundation

// MARK: - ArticleData
// 아티클 제목, 본문 제외 북마크, 스탬프 여부 등을 담는 데이터
struct ArticleData {
    let isLiked: Bool
    let isStamped: Bool
    let title: String
    let postId: Int
    let writer: String
    let createdDate: Date
    let bookmarkIdx: Int
    
    let paraGraphs: [Paragraph]
    
    init(isLiked: Bool, isStamped: Bool, title: String, postId: Int, writer: String, createdDate: Date, bookmarkIdx: Int, paragraph: [Paragraph]) {
        self.isLiked = isLiked
        self.isStamped = isStamped
        self.title = title
        self.postId = postId
        self.writer = writer
        self.createdDate = createdDate
        self.bookmarkIdx = bookmarkIdx
        
        self.paraGraphs = paragraph
    }
}
//var articledatalist: [ArticleData] = [.init(isLiked: true, isStamped: true, title: "오픈갤러리 : 내 거실이 갤러리, 미술 시장의 빈틈을 파고든 원화 구독 서비스", postId: "2", writer: "박시원", createdDate: "2023.11.09", bookmarkIdx: 1)
//]
var articledatalist: [ArticleData] = []
