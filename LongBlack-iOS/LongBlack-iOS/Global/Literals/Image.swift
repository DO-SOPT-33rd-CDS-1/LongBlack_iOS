//
//  Image.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/18/23.
//

/// 시용
// self.myImageView.image = ImageLiterals.Home.icHome

import UIKit

enum ImageLiterals {
    enum Home {
        static var imgLongBlack: UIImage { .load(named: "img_longblack")}
        static var imgHomeTop: UIImage { .load(named: "img_home_top")}
        static var imgThumbnail: UIImage { .load(named: "img_thumbnail")}
        static var icClock: UIImage { .load(named: "ic_clock")}
        static var icNote: UIImage { .load(named: "ic_note")}
        static var icLibrary: UIImage { .load(named: "ic_library")}
        static var icArrow: UIImage { .load(named: "ic_arrow")}
        static var icArrowLeft: UIImage { .load(named: "ic_arrow_left")}
        static var icArrowRight: UIImage { .load(named: "ic_arrow_right")}
        
        static var imgNoteDummy1: UIImage { .load(named: "imgNoteDummy1")}
        static var imgNoteDummy2: UIImage { .load(named: "imgNoteDummy2")}
        static var imgNoteDummy3: UIImage { .load(named: "imgNoteDummy3")}
        
        static var imgEventDummy1: UIImage { .load(named: "imgEventDummy1")}
        static var imgEventDummy2: UIImage { .load(named: "imgEventDummy2")}
        static var imgEventDummy3: UIImage { .load(named: "imgEventDummy3")}
        
        static var imgEventBanner: UIImage { .load(named: "imgEventBanner")}
    }
    
    enum TabBar {
        static var icNote: UIImage { .load(named: "ic_todaynote_default")}
        static var icNoteSelected: UIImage { .load(named: "ic_todaynote_active")}
        static var icAlarm: UIImage { .load(named: "ic_alarm_default")}
        static var icAlarmSelected: UIImage { .load(named: "ic_alarm_active")}
        static var icMyPage: UIImage { .load(named: "ic_mypage_default")}
        static var icMyPageSelected: UIImage { .load(named: "ic_mypage_active")}
    }
    
    enum Detail {
        static var readMark: UIImage { .load(named: "readmark")}
        static var bigStamp: UIImage { .load(named: "stamp_big")}
        static var bigCoffee: UIImage { .load(named: "coffee_big")}
        static var profileImg: UIImage { .load(named: "img_profile")}
        static var bookMark: UIImage { .load(named: "icBookmark")}
        static var bookMarkFill: UIImage { .load(named: "icBookmarkFill")}
        static var placeBookmark: UIImage { .load(named: "placeBookmark")}
        static var removeBookmark: UIImage { .load(named: "removeBookmark")}
    }
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
