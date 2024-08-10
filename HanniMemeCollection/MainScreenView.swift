//
//  MainScreenView.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/10/24.
//

import Foundation
import UIKit

class MainScreenView: UIView {
    let backgroundImageView = UIImageView()
    let moveButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private struct Constants {
        static let buttonBottomConstrains: CGFloat = 162
        static let buttonWidth: CGFloat = 221
        static let buttonHeight: CGFloat = 63
    }
    
}

extension MainScreenView {
    private func configureView() {
        configureBackground()
        configureMoveButton()
        configureLayout()
    }
    
    private func configureBackground() {
        self.addSubview(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.backgroundColor = .blue
    }
    
    private func configureMoveButton() {
        self.addSubview(moveButton)
        
        moveButton.translatesAutoresizingMaskIntoConstraints = false
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.background.backgroundColor = UIColor(red: 201/255, green: 100/255, blue: 226/255, alpha: 1)
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.title = "보러가기"
        buttonConfiguration.cornerStyle = .capsule
        moveButton.configuration = buttonConfiguration
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            moveButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            moveButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            moveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            moveButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.buttonBottomConstrains)
        ])
    }
}
