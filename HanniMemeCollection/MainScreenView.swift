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
        static let sideConstraints: CGFloat = 55
        static let topConstraints: CGFloat = 526
        static let bottomConstrains: CGFloat = 162
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
        // TODO: Add background color and style(capsule)
        self.addSubview(moveButton)
        
        moveButton.translatesAutoresizingMaskIntoConstraints = false
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.background.backgroundColor = .orange
        buttonConfiguration.title = "보러가기"
        
        moveButton.configuration = buttonConfiguration
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            moveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.sideConstraints),
            moveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.sideConstraints),
            moveButton.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.topConstraints),
            moveButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.bottomConstrains)
        ])
    }
}
