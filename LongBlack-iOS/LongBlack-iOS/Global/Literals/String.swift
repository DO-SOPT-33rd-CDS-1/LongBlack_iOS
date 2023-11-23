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
            static let noteButton = "전체 노트 보기"
            static let libraryButton = "라이브러리 가기"
        }
        
        enum Open {
            static let openNote = "공개 예정 노트"
            static let openDummyTitle1 = "웬디 맥노트 : 뉴욕타임즈 그래픽 저널리스트가, 낯선 이들을 그리며 배운것들"
            static let openDummyTitle2 = "LCK : ‘소환사의 협곡’은 어떻게 MZ의 놀이터가 됐나"
            static let openDummyTitle3 = "마케터 숭 : 고유함을 묻고 기록하고 알릴 때, 나라는 브랜드는 태어난다"
            static let openDummyName1 = "김윤지"
            static let openDummyName2 = "롱블랙"
            static let openDummyName3 = "롱블랙"
            static let openDummyInitial1 = "B"
            static let openDummyInitial2 = "K"
            static let openDummyInitial3 = "C"
        }
        
        enum Event {
            static let event = "이벤트"
        }
    }
}


