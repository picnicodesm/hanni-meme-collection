//
//  MemeCollectionViewController.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/10/24.
//

import UIKit

//TODO: 1. Cell Click -> WKView  2. Develop WKView

class MemeCollectionViewController: UIViewController {
    let navBar = MemeCollectionViewNavBar()
    let bgView = UIImageView(image: UIImage(named: "background_blue"))
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    lazy var navBackAction = UIAction { _ in
        self.navigationController?.popViewController(animated: true)
    }
    
    typealias Item = MemeVideo
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        ViewSticker.addBackgroundAndNavBar(backgroundView: bgView, navBar: navBar, to: self)
        configureCollectionView()
        configureDataSource()
        addBackNavActionToBackButton()
    }
}

extension MemeCollectionViewController {
    private func addBackNavActionToBackButton() {
        navBar.addAction(action: navBackAction, to: .back)
    }
}

extension MemeCollectionViewController {
    private func configureCollectionView() {
        let layout = configureLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(MemeCell.self, forCellWithReuseIdentifier: MemeCell.identifier)
        collectionView.delegate = self
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: GlobalConstants.sideConstraints),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -GlobalConstants.sideConstraints),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemeCell.identifier, for: indexPath) as? MemeCell else { return UICollectionViewCell() }
            cell.configureCell(title: item.title)
            
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(MemeVideo.mock)
        dataSource.apply(snapshot)
    }

    private func configureLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(16)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 25
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension MemeCollectionViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension MemeCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = MemeVideoViewController()
        destination.memeTitle = MemeVideo.mock[indexPath.item].title // <------- should edit
        self.navigationController?.pushViewController(destination, animated: true)
    }
}
