//
//  ArticleDataModel.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/22/23.
//

import Foundation

// MARK: - ArticleDataModel
struct ArticleDataModel: Codable {
    let postID: Int
    let title, writer, postType: String
    let createdDate: String
    let like, stamp: Bool
    let bookmarkIdx: Int
    let paragraphs: [Paragraph]

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case title, writer, createdDate, postType, like, stamp, paragraphs, bookmarkIdx
    }
}
// MARK: - Paragraph
struct Paragraph: Codable {
    let content, paragraphType: String
}
