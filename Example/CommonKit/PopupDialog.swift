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
    
    private lazy var actionStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    var title: String? = nil
    
    var attributedTitle: NSAttributedString? = nil
    
    var message: String? = nil
    
    var attributedMessage: NSAttributedString? = nil
    
    init(title: String?, attributedTitle: NSAttributedString? = nil, message: String? = nil, attributedMessage: NSAttributedString? = nil) {
        self.title = title
        self.attributedTitle = attributedTitle
        self.message = message
        self.attributedMessage = attributedMessage
        super.init(frame: .zero)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI() {
        configTitle()
        
    }
    
    func configTitle() {
        guard let title = title else { return }
        titleLabel.text = title
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    func configMessage() {
        guard let message = message else { return }
        messageLabel.text = title
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            messageLabel.topAnchor.constraint(equalTo: topAnchor),
            messageLabel.widthAnchor.constraint(equalTo: widthAnchor),
            messageLabel.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    func configTextF() {
        guard let message = message else { return }
        messageLabel.text = title
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            messageLabel.topAnchor.constraint(equalTo: topAnchor),
            messageLabel.widthAnchor.constraint(equalTo: widthAnchor),
            messageLabel.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    @discardableResult
    func title(_ style: LabelStyle) -> Self {
        titleLabel.text = style.text
        return self
    }
}
