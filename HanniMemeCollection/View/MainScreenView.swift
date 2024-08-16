//
//  MainScreenView.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/10/24.
//

import Foundation
import UIKit

class MainScreenView: UIView {
    var backgroundImageView: UIImageView!
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
        static let buttonBottomConstrains: CGFloat = 100
        static let buttonWidth: CGFloat = 290
        static let buttonHeight: CGFloat = 63
    }
    
}

extension MainScreenView {
    func addButtonAction(_ action: UIAction) {
        moveButton.addAction(action, for: .touchUpInside)
    }
}

extension MainScreenView {
    private func configureView() {
        configureBackground()
        configureMoveButton()
        configureLayout()
    }
    
    private func configureBackground() {
        let backgroundImageView = UIImageView()
        self.addSubview(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "MainScreenBackground")
        self.backgroundImageView = backgroundImageView
    }
    
    private func configureMoveButton() {
        self.addSubview(moveButton)
        
        moveButton.translatesAutoresizingMaskIntoConstraints = false
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.background.backgroundColor = GlobalConstants.buttonColor
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
