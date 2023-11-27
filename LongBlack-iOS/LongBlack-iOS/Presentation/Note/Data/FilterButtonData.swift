//
//  FilterButtonData.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/21/23.
//

import UIKit


struct FilterButtonData {
    let filter : String
    
    
    init(filter: String) {
        self.filter = filter
    }
}

var filterButtonData: [FilterButtonData] = [
    .init(filter: StringLiterals.Note.Filter.filterDummy1),
    .init(filter: StringLiterals.Note.Filter.filterDummy2),
    .init(filter: StringLiterals.Note.Filter.filterDummy3),
    .init(filter: StringLiterals.Note.Filter.filterDummy4),
    ]
