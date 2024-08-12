//
//  MemeCell.swift
//  HanniMemeCollection
//
//  Created by 김상민 on 8/12/24.
//

import UIKit

class MemeCell: UICollectionViewCell {
    static let identifier = "MemeCell"
    var thumbnailImageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureViews()
        configureLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    func configureCell(title: String) {
        self.titleLabel.text = title
    }
}

extension MemeCell {
    private func configureViews() {
        let thumbnailImageView = UIImageView()
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.image = UIImage(systemName: "apple.logo")
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(titleLabel)
        
        self.thumbnailImageView = thumbnailImageView
        self.titleLabel = titleLabel

    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            thumbnailImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 150),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
