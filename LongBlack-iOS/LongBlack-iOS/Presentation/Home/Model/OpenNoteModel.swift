//
//  OpenNoteModel.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/23/23.
//

import UIKit

struct OpenNoteModel {
    let image: UIImage?
    let title: String
    let writer: String
    let initial: String
}

let openNoteDummy: [OpenNoteModel] = [
    OpenNoteModel(image: ImageLiterals.Home.imgNoteDummy1, title: StringLiterals.Home.Open.openDummyTitle1, writer: StringLiterals.Home.Open.openDummyName1, initial: StringLiterals.Home.Open.openDummyInitial1),
    OpenNoteModel(image: ImageLiterals.Home.imgNoteDummy2, title: StringLiterals.Home.Open.openDummyTitle2, writer: StringLiterals.Home.Open.openDummyName2, initial: StringLiterals.Home.Open.openDummyInitial2),
    OpenNoteModel(image: ImageLiterals.Home.imgNoteDummy3, title: StringLiterals.Home.Open.openDummyTitle3, writer: StringLiterals.Home.Open.openDummyName3, initial: StringLiterals.Home.Open.openDummyInitial3)]
