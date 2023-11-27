//
//  NoteData.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit


struct NoteData {
    let image: UIImage
    let title: String
    let author: String
    let divider: String
    let nickname: String
    let state: Bool
    let backgroundColor: UIColor
    
    
    init(image: UIImage, title: String, author: String, divider: String, nickname: String, state: Bool, backgroundColor: UIColor) {
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
    .init(image: .imgNoteDummy4, title: StringLiterals.Note.NoteDummy.noteCardDummy1, author: StringLiterals.Note.NoteDummy.noteAuthorDummy1, divider: StringLiterals.Note.NoteDummy.noteDivider, nickname: StringLiterals.Note.NoteDummy.noteInitialDummy1, state: true, backgroundColor: .subcolorRed),
    .init(image: .imgNoteDummy5, title: StringLiterals.Note.NoteDummy.noteCardDummy2, author: StringLiterals.Note.NoteDummy.noteAuthorDummy2, divider: StringLiterals.Note.NoteDummy.noteDivider, nickname: StringLiterals.Note.NoteDummy.noteInitialDummy2, state: false, backgroundColor: .subcolorGreen),
    .init(image: .imgNoteDummy6, title: StringLiterals.Note.NoteDummy.noteCardDummy3, author: StringLiterals.Note.NoteDummy.noteAuthorDummy3, divider: StringLiterals.Note.NoteDummy.noteDivider, nickname: StringLiterals.Note.NoteDummy.noteInitialDummy3, state: false, backgroundColor: .subcolorGreen),
    .init(image: .imgNoteDummy7, title: StringLiterals.Note.NoteDummy.noteCardDummy4, author: StringLiterals.Note.NoteDummy.noteAuthorDummy4, divider: StringLiterals.Note.NoteDummy.noteDivider, nickname: StringLiterals.Note.NoteDummy.noteInitialDummy3, state: true, backgroundColor: .subcolorBlue),
    .init(image: .imgNoteDummy8, title: StringLiterals.Note.NoteDummy.noteCardDummy5, author: StringLiterals.Note.NoteDummy.noteAuthorDummy5, divider: StringLiterals.Note.NoteDummy.noteDivider, nickname: StringLiterals.Note.NoteDummy.noteInitialDummy4, state: true, backgroundColor: .subcolorBlue),
    .init(image: .imgNoteDummy9, title: StringLiterals.Note.NoteDummy.noteCardDummy6, author: StringLiterals.Note.NoteDummy.noteAuthorDummy6, divider: StringLiterals.Note.NoteDummy.noteDivider, nickname: StringLiterals.Note.NoteDummy.noteInitialDummy4, state: true, backgroundColor: .subcolorSand),
    .init(image: .imgNoteDummy10, title: StringLiterals.Note.NoteDummy.noteCardDummy7, author: StringLiterals.Note.NoteDummy.noteAuthorDummy7, divider: StringLiterals.Note.NoteDummy.noteDivider, nickname: StringLiterals.Note.NoteDummy.noteInitialDummy4, state: false, backgroundColor: .subcolorRed),
    .init(image: .imgNoteDummy11, title: StringLiterals.Note.NoteDummy.noteCardDummy8, author: StringLiterals.Note.NoteDummy.noteAuthorDummy8, divider: StringLiterals.Note.NoteDummy.noteDivider, nickname: StringLiterals.Note.NoteDummy.noteInitialDummy4, state: false, backgroundColor: .subcolorBlue)
    ]
