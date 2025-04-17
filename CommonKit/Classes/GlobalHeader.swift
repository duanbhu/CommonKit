//
//  AppCommon.swift
//  Posthouse_iOS
//
//  Created by Duanhu on 2023/3/9.
//

import UIKit
import JKSwiftExtension

// MARK: - 常用距离

public let kScreenBounds  = UIScreen.main.bounds

public let kScreenWidth = UIScreen.main.bounds.size.width

public let kScreenHeight = UIScreen.main.bounds.size.height

// MARK: - 屏幕适配375 | 6s尺寸
func kFitScale(at ratio: CGFloat) -> CGFloat {
    return (UIScreen.main.bounds.width / 375) * ratio
}

func kFitSize(w: CGFloat, h: CGFloat) -> CGSize {
    return CGSize(width: kFitScale(at: w), height: kFitScale(at: h))
}

public let kSafeAreaInsets = { () -> UIEdgeInsets in
    var insets = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
    if #available(iOS 13.0, *) {
        let keyWindow = UIApplication.shared.connectedScenes
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows.first
        insets = keyWindow?.safeAreaInsets ?? insets

    } else {
        insets = UIApplication.shared.keyWindow?.safeAreaInsets ?? insets
    }
    return insets
}

public let isIphoneX = { () -> Bool in
    return kSafeAreaInsets().bottom > 0
}

public let kSafeAreaTop = kSafeAreaInsets().top == 0 ? 44 : kSafeAreaInsets().top
public let kSafeAreaBottom = kSafeAreaInsets().bottom
public let kSafeAreaInsetBottom = kSafeAreaInsets().bottom

public let kStatusBarHeight = kSafeAreaInsets().top

public let kNavHeight = 44.0

public let kSafeAreaTopHeight = kNavHeight + kStatusBarHeight

public let kTabBarH = 49 + kSafeAreaBottom


