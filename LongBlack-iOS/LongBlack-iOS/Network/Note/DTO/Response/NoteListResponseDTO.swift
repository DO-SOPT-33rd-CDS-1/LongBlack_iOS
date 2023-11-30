//
//  NoteListResponseDTO.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/30/23.
//

import Foundation

// MARK: - NoteLisetResponseDTO
struct NoteListResponseDTO: Codable {
    let posts: [Post]
}

// MARK: - Post
struct Post: Codable {
    let id: Int
    let title, writer, postType, color: String
    let like: Bool
}
