//
//  LibraryViewData.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/27/23.
//

import UIKit


struct LibraryData {
    let libraryStamp1: UIImage
    let libraryStamp2: UIImage
    let libraryStamp3: UIImage
    let libraryStamp4: UIImage
    let libraryStamp5: UIImage
    let libraryStamp6: UIImage
    let libraryStamp7: UIImage
    let libraryStamp8: UIImage
    let libraryStamp9: UIImage
    let libraryStamp10: UIImage
    let libraryStamp11: UIImage
    let libraryStamp12: UIImage
    
    
    
    init(libraryStamp1: UIImage, libraryStamp2: UIImage, libraryStamp3: UIImage, libraryStamp4: UIImage, libraryStamp5: UIImage, libraryStamp6: UIImage, libraryStamp7: UIImage, libraryStamp8: UIImage, libraryStamp9: UIImage, libraryStamp10: UIImage, libraryStamp11: UIImage, libraryStamp12: UIImage) {
        self.libraryStamp1 = libraryStamp1
        self.libraryStamp2 = libraryStamp2
        self.libraryStamp3 = libraryStamp3
        self.libraryStamp4 = libraryStamp4
        self.libraryStamp5 = libraryStamp5
        self.libraryStamp6 = libraryStamp6
        self.libraryStamp7 = libraryStamp7
        self.libraryStamp8 = libraryStamp8
        self.libraryStamp9 = libraryStamp9
        self.libraryStamp10 = libraryStamp10
        self.libraryStamp11 = libraryStamp11
        self.libraryStamp12 = libraryStamp12
    }
}

var libraryData: [LibraryData] = [
    .init(libraryStamp1: .stickerSmallFill, libraryStamp2: .stickerSmallFill, libraryStamp3: .stickerSmallEmpty, libraryStamp4: .stickerSmallEmpty, libraryStamp5: .stickerSmallEmpty, libraryStamp6: .stickerSmallEmpty, libraryStamp7: .stickerSmallEmpty, libraryStamp8: .stickerSmallEmpty, libraryStamp9: .stickerSmallEmpty, libraryStamp10: .stickerSmallEmpty, libraryStamp11: .stickerSmallEmpty, libraryStamp12: .stickerSmallEmpty)
    ]
