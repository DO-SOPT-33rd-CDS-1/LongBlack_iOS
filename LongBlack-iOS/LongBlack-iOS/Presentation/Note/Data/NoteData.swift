//
//  NoteData.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit


struct NoteData {
    let id: Int
    let title: String
    let author: String
    let nickname: String
    let state: Bool
    let backgroundColor: UIColor
    
    
    init(id: Int, title: String, author: String, nickname: String, state: Bool, backgroundColor: UIColor) {
        self.id = id
        self.title = title
        self.author = author
        self.nickname = nickname
        self.state = state
        self.backgroundColor = backgroundColor
    }
}

//var noteData: [NoteData] = []


