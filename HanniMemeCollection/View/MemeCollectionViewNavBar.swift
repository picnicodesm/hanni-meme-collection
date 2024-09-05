//
//  MemeCollectionViewNavBar.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/12/24.
//

import UIKit

class MemeCollectionViewNavBar: UIView {
    private let hStack = UIStackView()
    private let backButton = UIButton(type: .system)
    private let favoriteButton = UIButton(type: .system)
    private let titleLabel = UILabel()
    private let title = "Memes"
    
    enum ButtonType {
        case back
        case favorite
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        hierarchy()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAction(action: UIAction, to buttonType: ButtonType){
        switch buttonType {
        case .back:
            backButton.addAction(action, for: .touchUpInside)
        case .favorite:
            favoriteButton.addAction(action, for: .touchUpInside)
        }
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }

    func toggleFavoriteButton(to isOn: Bool) {
        guard var buttonConfig = favoriteButton.configuration else { return }
        buttonConfig.image = isOn ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        buttonConfig.baseForegroundColor = isOn ? .green : .black
        favoriteButton.configuration = buttonConfig
    }

    private struct Constants {
        static let buttonWidth: CGFloat = 30
        static let buttonHeight: CGFloat = 30
        static let buttonCornerRadius: CGFloat = 15
        static let buttonStrokWidth: CGFloat = 1
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
            hStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: GlobalConstants.sideConstraints),
            hStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -GlobalConstants.sideConstraints),
            hStack.heightAnchor.constraint(equalToConstant: GlobalConstants.navBarHeight),
            backButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            backButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            favoriteButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            favoriteButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
        ])
    }
    
    private func configureButton() {
        var backButtonConfig = UIButton.Configuration.plain()
        var favoriteButtonConfig = UIButton.Configuration.plain()
        var buttonBackgrounConfig = UIBackgroundConfiguration.clear()
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .small)
        let baseForegroundColor = UIColor.black
   
        buttonBackgrounConfig.backgroundColor = .white
        buttonBackgrounConfig.strokeColor = baseForegroundColor
        buttonBackgrounConfig.strokeWidth = Constants.buttonStrokWidth
        buttonBackgrounConfig.cornerRadius = Constants.buttonCornerRadius
        
        backButtonConfig.image = UIImage(systemName: "chevron.left")
        backButtonConfig.baseForegroundColor = baseForegroundColor
        backButtonConfig.preferredSymbolConfigurationForImage = symbolConfiguration
        backButtonConfig.background = buttonBackgrounConfig
        
        favoriteButtonConfig.image = UIImage(systemName: "heart")
        favoriteButtonConfig.baseForegroundColor = baseForegroundColor
        favoriteButtonConfig.preferredSymbolConfigurationForImage = symbolConfiguration
        favoriteButtonConfig.background = buttonBackgrounConfig

        backButton.configuration = backButtonConfig
        favoriteButton.configuration = favoriteButtonConfig
    }
}
