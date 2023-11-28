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
    
    enum Library {
        
        enum Title {
            static let libraryTitle = "라이브러리"
        }
        
        enum Page {
            static let stampPage = "스탬프"
            static let myNotePage = "내노트"
            static let stickerPage = "스티커"
            static let bookmarkPage = "북마크"
        }
        
        enum Button {
            static let beforeExchangedButton = "미교환"
            static let exchangedButton = "교환"
        }
        
        enum Stamp {
            static let stampTitle = "진행 중인 스탬프카드"
            static let stampCardTitle = "카드2"
            static let stampDescription = "스탬프 12개를 다 채우면 샷 1개를 증정합니다!"
            static let exchangeButton = "샷으로 교환하기"
        }
        
        enum Card {
            static let cardTitle = "미교환 스탬프카드"
            static let cardName = "카드1"
            static let cardDate = "2023.11.13"
            static let cardExchangeButton = "교환하기"
        }
        
        enum Description {
            static let descriptionDummy1 = "스탬프 획득하지 않은 읽은 노트도 다시 접속해 스탬프를 획득할 수 있습니다."
            static let descriptionDummy2 = "노트당 스탬프 획득은 최초 1회만 가능합니다."
            static let descriptionDummy3 = "샷으로 교환 후 14일 이내(교환일 기준)에 사용하셔야합니다."
            static let descriptionDummy4 = "증정으로 받은 샷은 환볼 받을 수 없습니다."
            static let descriptionDummy5 = "샷은 멤버십을 유지하고 있어야 사용이 가능합니다."
        }
    }
}


