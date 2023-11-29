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
    let title, writer, createdDate, postType: String
    let like, stamp: Bool
    let paragraphs: [Paragraph]

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case title, writer, createdDate, postType, like, stamp, paragraphs
    }
}

// MARK: - Paragraph
struct Paragraph: Codable {
    let content, paragraphType: String
}
