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

var kKeyWindow: UIWindow? {
    if #available(iOS 13, *) {
        return UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    } else {
        return UIApplication.shared.keyWindow
    }
}

public var isIphoneX: Bool {
    if #available(iOS 11.0, *) {
        if let window = kKeyWindow {
            return window.safeAreaInsets.bottom > 0
        } else {
            return false
        }
    } else {
        return UIApplication.shared.statusBarFrame.height > 20
    }
}

public var kStatusBarHeight: CGFloat {
    if #available(iOS 13.0, *) {
        let window: UIWindow? = UIApplication.shared.windows.first
        let statusBarHeight = (window?.windowScene?.statusBarManager?.statusBarFrame.height) ?? 0
        return statusBarHeight
    } else {
        // 防止界面没有出来获取为0的情况
        return UIApplication.shared.statusBarFrame.height > 0 ? UIApplication.shared.statusBarFrame.height : 44
    }
}

public let kNavHeight = 44.0

public var kSafeAreaTopHeight: CGFloat {
    return kNavHeight + kStatusBarHeight
}

public var kSafeAreaInsetBottom: CGFloat {
    return isIphoneX ? 34 : 0
}

public let kTabBarHeight: CGFloat = 49.0

public var kSafeAreaBottomHeight: CGFloat {
    return kTabBarHeight + kSafeAreaInsetBottom
}

