//
//  UIColor+Extend.swift
//  UIColor
//
//  Created by TAN on 2018/8/30.
//  Copyright © 2018年 iOS. All rights reserved.
//  UIColor使用拓展

import UIKit

public extension UIColor {
    
    /// 16进制转化Color
    ///
    /// - Parameter hex: 16进制
    /// - Returns: Color
    class func colorHexStr(_ hex: String) -> UIColor {
        colorHexStr(hex, alpha: 1)
    }
    
    class func color(_ hex: String, alpha: CGFloat = 1) -> UIColor {
        colorHexStr(hex, alpha: alpha)
    }
    
    /// 16进制转化Color
    ///
    /// - Parameters:
    ///   - hex: 16进制
    ///   - alpha: 透明度
    /// - Returns: Color
    class func colorHexStr(_ hex: String, alpha: CGFloat) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    
    // MARK: - RGB的颜色设置
    class func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
    class func RGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/1.0)
    }
    
    // MARK: - 随机颜色
    /// 随机颜色
    ///
    /// - Returns: 随机颜色
    class func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256))
        let green = CGFloat(arc4random_uniform(256))
        let blue = CGFloat(arc4random_uniform(256))
        return RGB(r: red, g: green, b: blue)
    }
    
    /// 应用控件主题颜色  #EA955E
    class var appTheme: UIColor {
        return colorHexStr("#5C7DFF")
    }
    
    class var disabledTheme: UIColor {
        return colorHexStr("#5C7DFF", alpha: 0.3)
    }
    
    /// 导航栏背景黑色 #5C4D73
    class var navBackground: UIColor {
        return .appTheme
    }
    
    /// 应用控件黑色 #545C6A
    class var appBlack: UIColor {
        return colorHexStr("545C6A")
    }
    
    /// 特黑 2C211B
    class var extraBlack: UIColor {
        return colorHexStr("#2C211B")
    }
    
    /// 应用控件灰色 #B5B5B7
    class var appGray: UIColor {
        return colorHexStr("B5B5B7")
    }
    
    /// 应用控件灰色 #626262
    class var textGray: UIColor {
        return colorHexStr("#626262")
    }
    
    class var disabled: UIColor {
        return colorHexStr("DAD9DB")
    }
 
    /// 橙色  #FA7110
    class var appOrange: UIColor {
        return colorHexStr("#FA7110")
    }
    
    /// E55404
    class var appRed: UIColor {
        return colorHexStr("D05959")
    }
    
    /// 背景颜色 F1F4F8
    class var background: UIColor {
        return colorHexStr("F1F4F8")
    }
    
    /// 背景颜色 F8F8F8
    class var backgroundF8: UIColor {
        return colorHexStr("F8F8F8")
    }
    
    class var backgroundF5: UIColor {
        return colorHexStr("#F5F5F5")
    }
        
    /// 背景颜色 F8F8F8
    class var F8F8F8: UIColor {
        return colorHexStr("F8F8F8")
    }
    
    /// 输入框占位符颜色 B5B5B5
    class var placeholder: UIColor {
        return colorHexStr("#B5B5B5")
    }
    
    class var lightPlaceholder: UIColor {
        return color("#C2C2C2")
    }
    
    /// 分割线 F0F0F0
    class var line: UIColor {
        return color("#F0F0F0", alpha: 0.8)
    }
    
    /// 分割线 #D8D8D8
    class var lineD8: UIColor {
        return color("#D8D8D8")
    }
    
    class var lineF2: UIColor {
        return color("#F2F2F2")
    }
    
    class var lineED: UIColor {
        return color("#EDEDED")
    }
    
    class var normal: UIColor {
        return colorHexStr("E8E8E8")
    }
    
    class var select: UIColor {
        return colorHexStr("E3E8FA")
    }
    
    /// app状态颜色  默认
    class var `default`: UIColor {
        return colorHexStr("CE864F")
    }
    
    /// app状态颜色 待接收
    class var unknown: UIColor {
        return colorHexStr("694FCE")
    }
    
    /// app状态颜色  成功
    class var success: UIColor {
        return colorHexStr("#03B385")
    }
    
    /// app状态颜色  失败 红
    class var fail: UIColor {
        return colorHexStr("C4350E")
    }
}
