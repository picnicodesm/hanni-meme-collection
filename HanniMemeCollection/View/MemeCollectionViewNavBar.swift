//
//  MemeCollectionViewNavBar.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/12/24.
//

import UIKit

class MemeCollectionViewNavBar: UIView {
    let hStack = UIStackView()
    let backButton = UIButton(type: .system)
    let favoriteButton = UIButton(type: .system)
    let titleLabel = UILabel()
    
    enum ButtonType {
        case back
        case favorite
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Hanni Memes"
        hierarchy()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    struct Constants {
        static let sideConstraints: CGFloat = 24
        static let buttonWidth: CGFloat = 30
        static let buttonHeight: CGFloat = 30
        static let buttonCornerRadius: CGFloat = 15
        static let buttonStrokWidth: CGFloat = 1
    }
    
    func addAction(action: UIAction, to buttonType: ButtonType){
        switch buttonType {
        case .back:
            backButton.addAction(action, for: .touchUpInside)
        case .favorite:
            favoriteButton.addAction(action, for: .touchUpInside)
        }
    }
   
}

extension MemeCollectionViewNavBar {
    private func hierarchy() {
        hStack.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(hStack)
        let _ = [backButton, titleLabel, favoriteButton].map {
            hStack.addArrangedSubview($0)
        }
        hStack.alignment = .center
        hStack.axis = .horizontal
        hStack.distribution = .equalSpacing
    
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            hStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.sideConstraints),
            hStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.sideConstraints),
            hStack.heightAnchor.constraint(equalToConstant: GlobalConstants.navBarHeight),
            backButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            backButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            favoriteButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            favoriteButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
        ])
    }
    
    private func configureButton() {
        print(backButton.isUserInteractionEnabled)
        
        var backButtonConfig = UIButton.Configuration.plain()
        var favoriteButtonConfig = UIButton.Configuration.plain()
        var buttonBackgrounConfig = UIBackgroundConfiguration.clear()
   
        buttonBackgrounConfig.backgroundColor = .white
        buttonBackgrounConfig.strokeColor = .black
        buttonBackgrounConfig.strokeWidth = Constants.buttonStrokWidth
        buttonBackgrounConfig.cornerRadius = Constants.buttonCornerRadius
        
        backButtonConfig.image = UIImage(systemName: "chevron.left")
        backButtonConfig.baseForegroundColor = .black
        backButtonConfig.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .small)
        backButtonConfig.background = buttonBackgrounConfig
        
        favoriteButtonConfig.image = UIImage(systemName: "heart")
        favoriteButtonConfig.baseForegroundColor = .black
        favoriteButtonConfig.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .small)
        favoriteButtonConfig.background = buttonBackgrounConfig

        backButton.configuration = backButtonConfig
        favoriteButton.configuration = favoriteButtonConfig
    }
}
