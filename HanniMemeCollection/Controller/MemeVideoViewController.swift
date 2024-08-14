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
    var webView: WKWebView!
    var memeTitle: String = "Meme"
    var pageLoaded = false
    lazy var navBackAction = UIAction { _ in
        self.navigationController?.popViewController(animated: true)
    }
    let hanni = "https://www.youtube.com/shorts/cxo-IeAG2T4"
    let urlStrings = "https://www.youtube.com/watch?v=eUq40RHyqo0"
    let key = "cxo-IeAG2T4"
    var thumbnailString: String { "https://img.youtube.com/vi/\(key)/0.jpg" }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewSticker.addBackgroundAndNavBar(backgroundView: bgView, navBar: navBar, to: self)
        navBar.setTitle(memeTitle)
        addBackNavActionToBackButton()
        createWebView()
        loadWebView()
    }
}

extension MemeVideoViewController {
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
            webView.heightAnchor.constraint(equalTo: webView.widthAnchor, multiplier: 16/9)
        ])
    }
    
    private func loadWebView() {
        
        guard let url = URL(string: "https://www.youtube.com/shorts/cxo-IeAG2T4") else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }

    private func addBackNavActionToBackButton() {
        navBar.addAction(action: navBackAction, to: .back)
    }
}

extension MemeVideoViewController {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.url) {
            guard let url = self.webView.url?.absoluteString else { return }
        
            if !(url == "https://www.youtube.com/shorts/cxo-IeAG2T4" || url == "https://m.youtube.com/shorts/cxo-IeAG2T4") {
                loadWebView()
            }
        }
    }
}

