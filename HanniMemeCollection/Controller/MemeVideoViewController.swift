//
//  MemeVideoViewController.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/13/24.
//

import UIKit
import WebKit

class MemeVideoViewController: UIViewController {
    let navBar = MemeCollectionViewNavBar()
    let bgView = UIImageView(image: UIImage(named: "background_blue"))
    let viewAspectRatio: CGFloat = 16/9
    var webView: WKWebView!
    lazy var navBackAction = UIAction { _ in
        self.navigationController?.popViewController(animated: true)
    }
    lazy var toggleFavoriteAction = UIAction { _ in
        guard var meme = self.memeVideo else { return }
        let isBecameFavortie = meme.toggleFavorite()
        self.navBar.toggleFavoriteButton(to: isBecameFavortie)
        self.memeVideo = meme
    }

    var memeVideo: MemeVideo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewSticker.addBackgroundAndNavBar(backgroundView: bgView, navBar: navBar, to: self)
        navBar.setTitle(memeVideo?.title ?? "Meme")
        setFavoriteButton()
        addBackNavActionToBackButton()
        addToggleFavoriteActionToFavoriteButton()
        createWebView()
        loadWebView()
    }
}

extension MemeVideoViewController {
    private func setFavoriteButton() {
        guard let memeVideo = memeVideo else { return }
        navBar.toggleFavoriteButton(to: memeVideo.isFavorite)
    }
    
    private func createWebView() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
         
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        view.addSubview(webView)
        self.webView = webView
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: GlobalConstants.sideConstraints),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -GlobalConstants.sideConstraints),
            webView.heightAnchor.constraint(equalTo: webView.widthAnchor, multiplier: viewAspectRatio)
        ])
    }
    
    private func loadWebView() {
        guard let meme = memeVideo else { return }
        guard let url = URL(string: meme.urlString) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }

    private func addBackNavActionToBackButton() {
        navBar.addAction(action: navBackAction, to: .back)
    }
    
    private func addToggleFavoriteActionToFavoriteButton() {
        navBar.addAction(action: toggleFavoriteAction, to: .favorite)
    }
}

extension MemeVideoViewController {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.url) {
            guard let memeVideo = memeVideo else { return }
            guard let url = self.webView.url?.absoluteString else { return }
        
            guard let range = memeVideo.urlString.range(of: "www") else { return }
            let modifiedURL = memeVideo.urlString.replacingCharacters(in: range, with: "m")
            
            if !(url == memeVideo.urlString || url == modifiedURL) {
                loadWebView()
            }
        }
    }
}

