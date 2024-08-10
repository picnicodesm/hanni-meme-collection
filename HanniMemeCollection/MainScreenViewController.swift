//
//  MainScreenViewController.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/10/24.
//

import UIKit

class MainScreenViewController: UIViewController {

    let mainScreenView = MainScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
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
}

