//
//  MemeCollectionViewController.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/10/24.
//

import UIKit

class MemeCollectionViewController: UIViewController {
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = MemeVideo
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
    }
    
}

extension MemeCollectionViewController {
    private func configureCollectionView() {
        let layout = configureLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MemeCell.self, forCellWithReuseIdentifier: MemeCell.identifier)
        view.addSubview(collectionView)
        self.collectionView = collectionView
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
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
