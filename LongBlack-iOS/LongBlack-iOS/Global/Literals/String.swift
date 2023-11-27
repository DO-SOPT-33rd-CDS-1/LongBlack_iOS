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
    
    enum Note {
        enum TabBar {
            static let noteViewTitle = "노트"
            static let noteViewSearchPlaceholder = "검색어를 입력하세요"
        }
        
        enum Filter {
            static let filterDummy1 = "안 읽은 노트"
            static let filterDummy2 = "스탬프 받은 노트"
            static let filterDummy3 = "평점 5점 준 노트"
            static let filterDummy4 = "북마크 한 노트"
        }
        
        enum NoteDummy {
            static let noteCardDummy1 = "오픈갤러리 : 내 거실이 갤러리, 미술 시장의 빈틈을 파고든 원화 구독 ···"
            static let noteCardDummy2 = "무스토이 : OMG와 슈퍼해피 정신으로, 아마존 1위 장난감이 되다"
            static let noteCardDummy3 = "애시드 리그 : 커피·고수·김치맛 식초, 4000개의 슈퍼마켓 매대를 꿰차다"
            static let noteCardDummy4 = "조병수 : 10년 뒤 서울엔 산과 강, 바람이 있을까” 건축가가 묻다"
            static let noteCardDummy5 = "코오롱스포츠 : 연 8000억 매출의 50년 아웃도어 브랜드, 오리진을 ···"
            static let noteCardDummy6 = "First, Learn to practice : 조금 더 계속하는 바로 그 순간"
            static let noteCardDummy7 = "엄커피 : 아버지가 브라질에 뿌린 커피콩, 아들을 바리스타 챔피언으로 ···"
            static let noteCardDummy8 = "아루히 : 손님과의 케미스트리로, ‘스강신청’ 오마카세 집이 되다"
            
            static let noteAuthorDummy1 = "박희정"
            static let noteAuthorDummy2 = "방민지"
            static let noteAuthorDummy3 = "손명지"
            static let noteAuthorDummy4 = "신민철"
            static let noteAuthorDummy5 = "이연진"
            static let noteAuthorDummy6 = "이우제"
            static let noteAuthorDummy7 = "이준희"
            static let noteAuthorDummy8 = "정채은"
            
            static let noteDivider = "|"
            
            static let noteInitialDummy1 = "P"
            static let noteInitialDummy2 = "B"
            static let noteInitialDummy3 = "S"
            static let noteInitialDummy4 = "L"
            
        }
    }
}
