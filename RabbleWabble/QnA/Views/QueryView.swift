//
//  QuestionView.swift
//  RabbleWabble
//
//  Created by wonkwh on 03/12/2018.
//  Copyright © 2018 wonkwh. All rights reserved.
//

import UIKit

extension UIView {
    func anchor (top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0, enableInsets: Bool = false) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        let margins = self.layoutMargins
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset+margins.top).isActive = true

        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft + margins.left).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -(paddingRight + margins.right)).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -(paddingBottom + bottomInset + margins.bottom)).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
}

class QueryView: UIView {
    let promptLabel: UILabel = {
        let label = UILabel()
        label.text = "Prompt"
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    let hintLabel: UILabel = {
        let label = UILabel()
        label.text = "Hint"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let answerLabel: UILabel = {
        let label = UILabel()
        label.text = "Answer"
        label.font = UIFont.systemFont(ofSize: 48)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let incorrectButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "ic_circle_x"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    let incorrectCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = UIColor.red
        return label
    }()

    let correctButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "ic_circle_check"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    let correctCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = UIColor.green
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        addSubview(promptLabel)
        addSubview(hintLabel)
        addSubview(answerLabel)
        addSubview(correctButton)
        addSubview(correctCountLabel)
        addSubview(incorrectButton)
        addSubview(incorrectCountLabel)
        
        //MARK: - constraint
        promptLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 80)
        hintLabel.anchor(top: promptLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        answerLabel.anchor(top: hintLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 50)
        
        correctButton.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 32, paddingBottom: 72)
        correctCountLabel.anchor(top: correctButton.bottomAnchor, bottom: bottomAnchor, paddingTop: 8, paddingBottom: 24)
        correctCountLabel.centerXAnchor.constraint(equalTo: correctButton.centerXAnchor).isActive = true

        incorrectButton.anchor(bottom: bottomAnchor, right: rightAnchor, paddingBottom: 72, paddingRight: 32)
        incorrectCountLabel.anchor(top: incorrectButton.bottomAnchor, bottom: bottomAnchor, paddingTop: 8, paddingBottom: 24)
        incorrectCountLabel.centerXAnchor.constraint(equalTo: incorrectButton.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
