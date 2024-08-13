//
//  MemeVideoViewController.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/13/24.
//

import UIKit

class MemeVideoViewController: UIViewController {
    let navBar = MemeCollectionViewNavBar()
    let bgView = UIImageView(image: UIImage(named: "background_blue"))
    var memeTitle: String = "Meme"
    lazy var navBackAction = UIAction { _ in
        self.navigationController?.popViewController(animated: true)
    }
    let tLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Video View"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewSticker.addBackgroundAndNavBar(backgroundView: bgView, navBar: navBar, to: self)
        navBar.setTitle(memeTitle)
        addBackNavActionToBackButton()
        view.addSubview(tLabel)
        NSLayoutConstraint.activate([
            tLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])

    }
    
}

extension MemeVideoViewController {    
    private func addBackNavActionToBackButton() {
        navBar.addAction(action: navBackAction, to: .back)
    }
}
