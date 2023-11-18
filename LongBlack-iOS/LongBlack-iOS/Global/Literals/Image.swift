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
        static var icHome: UIImage { .load(named: "(이름을적어주세요)")}
    }
    
    enum TabBar {
        static var icNote: UIImage { .load(named: "icNote")}
        static var icNoteSelected: UIImage { .load(named: "icNoteSelected")}
        static var icAlarm: UIImage { .load(named: "icAlarm")}
        static var icAlarmSelected: UIImage { .load(named: "icAlarmSelected")}
        static var icMyPage: UIImage { .load(named: "icMyPage")}
        static var icMyPageSelected: UIImage { .load(named: "icMyPageSelected")}
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
