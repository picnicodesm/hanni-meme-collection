//
//  MemeCollectionViewController.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/10/24.
//

// TODO: add return type (configureLayout)
// TODO: edit Item type

import UIKit

class MemeCollectionViewController: UIViewController {
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = Int
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension MemeCollectionViewController {
    private func configureDataSource() {
    }
    

    private func configureLayout() {
        
    }
}
