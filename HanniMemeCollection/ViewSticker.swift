//
//  ViewSticker.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/13/24.
//

import Foundation
import UIKit

class ViewSticker {
    static func addBackgroundAndNavBar(backgroundView bg: UIImageView, navBar: UIView, to vc: UIViewController) {
        addBackgroundView(bg, to: vc)
        addNavBar(navBar, to: vc)
    }
    
    static func addNavBar(_ view: UIView,to vc: UIViewController) {
        vc.view.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor),
            view.leadingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: GlobalConstants.navBarHeight)
        ])
    }
    
    static func addBackgroundView(_ view: UIImageView, to vc: UIViewController) {
        vc.view.backgroundColor = .white
        vc.view.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: vc.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: GlobalConstants.backgroundImageHeight),
        ])
    }
}



