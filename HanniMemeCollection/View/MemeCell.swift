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
    let key = "cxo-IeAG2T4"
    var thumbnailString: String { "https://img.youtube.com/vi/\(key)/0.jpg" }
    
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
        
        DispatchQueue.global().async {
            guard let url = URL(string: self.thumbnailString) else { return }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.thumbnailImageView.image = image
                    }
                }
            }
            
        }
        
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.layer.cornerRadius = 15
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textAlignment = .left
        
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(titleLabel)
        
        self.thumbnailImageView = thumbnailImageView
        self.titleLabel = titleLabel
        
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor, multiplier: 1),
            
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
