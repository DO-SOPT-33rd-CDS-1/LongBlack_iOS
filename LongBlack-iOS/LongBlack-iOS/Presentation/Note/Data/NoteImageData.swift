//
//  NoteImageData.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 12/1/23.
//


import UIKit


struct NoteImageData {
    let image: UIImage
    
    
    init(image: UIImage) {
        self.image = image
    }
}

var noteImageData: [NoteImageData] = [
    .init(image: .imgNoteDummy4),
    .init(image: .imgNoteDummy5),
    .init(image: .imgNoteDummy6),
    .init(image: .imgNoteDummy7),
    .init(image: .imgNoteDummy8),
    .init(image: .imgNoteDummy9),
    .init(image: .imgNoteDummy10),
    .init(image: .imgNoteDummy11)
    ]
