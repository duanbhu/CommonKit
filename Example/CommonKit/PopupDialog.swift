//
//  PopupDialog.swift
//  CommonKit_Example
//
//  Created by Duanhu on 2024/4/1.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit

public struct LabelStyle {
    
    public var text: String = ""
    
    public var attributedText: NSAttributedString?
    
    public var textColor: UIColor = .black
    
    public var font: UIFont = .systemFont(ofSize: 14)

    public var backgroundColor: UIColor = .clear
   
    public init() {}
    
    public enum Part {
        case text(String)
        case attributedText(NSAttributedString)
        case font(UIFont)
        case textColor(UIColor)
        case backgroundColor(UIColor)
    }
    
    public init(_ parts: Part...) {
        self.init(parts)
    }

    /// Create a `StringStyle` from an array of parts
    ///
    /// - Parameter parts: An array of `StylePart`s
    public init(_ parts: [Part]) {
        self.init()
        for part in parts {
            update(part: part)
        }
    }
    
    mutating func update(part stylePart: Part) {
        switch stylePart {
        case .text(let text):
            self.text = text
        case .attributedText(let attributedText):
            self.attributedText = attributedText
        case .font(let font):
            self.font = font
        case .textColor(let textColor):
            self.textColor = textColor
        case .backgroundColor(let backgroundColor):
            self.backgroundColor = backgroundColor
        }
    }
}

class PopupDialog: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var actionBackgroundView: UIView = {
        let label = UIView()
            
        return label
    }()
    
    @discardableResult
    func title(_ style: LabelStyle) -> Self {
        
        titleLabel.text = style.text
        return self
    }
    
    
}
