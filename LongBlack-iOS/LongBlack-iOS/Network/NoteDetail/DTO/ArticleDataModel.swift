//
//  ArticleDataModel.swift
//  LongBlack-iOS
//
//  Created by Woo Jye Lee on 11/22/23.
//

import Foundation

// MARK: - ArticleDataModel
struct ArticleDataModel: Codable {
    let postID, bookmarkIdx: Int
    let title, writer, postType: String
    let createdDate: Date
    let like, stamp: Bool
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
