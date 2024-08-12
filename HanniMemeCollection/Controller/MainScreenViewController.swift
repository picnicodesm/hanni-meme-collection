//
//  MainScreenViewController.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/10/24.
//

import UIKit

class MainScreenViewController: UIViewController {

    let mainScreenView = MainScreenView()
    lazy var navigateAction = UIAction { _ in
        let destination = MemeCollectionViewController()
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureView()
        addButtonAction()
    }

    private func configureView() {
        view.addSubview(mainScreenView)
        
        NSLayoutConstraint.activate([
            mainScreenView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainScreenView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func addButtonAction() {
        mainScreenView.addButtonAction(navigateAction)
    }
}

