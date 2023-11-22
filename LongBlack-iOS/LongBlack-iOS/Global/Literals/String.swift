//
//  String.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

/// 사용
// textLabel.text = StringLiterals.Home.Item.title

import Foundation

enum StringLiterals {
    enum Home {
        enum TabBar {
            static let note = "오늘의 노트"
            static let alarm = "알람"
            static let myPage = "마이페이지"
        }
        
        enum Time {
            static let titleLabel = "이 시간이 지나면\n읽을 수 없습니다."
        }
        
        enum Main {
            static let todaysNote = "오늘의 노트"
            static let todaysNoteTitle = "오픈갤러리 : 내 거실이 갤러리, 미술 시장의 빈틈을 파고든 원화 구독 서비스"
            static let noteCommunity = "노트 커뮤니티"
            static let noteCommunityDescription = "“사람이 없어도 운영이 안되는 경우도 간혹 있던데...😢😢”"

        }
    }
}


