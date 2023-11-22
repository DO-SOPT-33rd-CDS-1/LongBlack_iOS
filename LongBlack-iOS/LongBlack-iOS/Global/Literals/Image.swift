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
        static var icDetail: UIImage { .load(named: "(이름을적어주세요)")}
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
