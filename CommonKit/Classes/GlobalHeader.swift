//
//  AppCommon.swift
//  Posthouse_iOS
//
//  Created by Duanhu on 2023/3/9.
//

import UIKit

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

public let isIphoneX = { () -> Bool in
    var isX = false
    if #available(iOS 11.0, *) {
        isX = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0) > CGFloat(0.0)
    }
    return isX
}

public let kWindowSafeAreaInset = { () -> UIEdgeInsets in
    var insets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    if #available(iOS 11.0, *) {
        insets = UIApplication.shared.keyWindow?.safeAreaInsets ?? insets
    }
    return insets
}

public let kSafeAreaTop = kWindowSafeAreaInset().top == 0 ? 20 : kWindowSafeAreaInset().top

public let kSafeAreaInsetBottom = kWindowSafeAreaInset().bottom

public let kStatusBarHeight = kWindowSafeAreaInset().top

public let kNavHeight = 44.0

public let kSafeAreaTopHeight = kNavHeight + kStatusBarHeight

public let kTabBarHeight = 49.0

public let kSafeAreaBottomHeight = kTabBarHeight + kSafeAreaInsetBottom

