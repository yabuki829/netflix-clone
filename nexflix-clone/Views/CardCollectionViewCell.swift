//
//  CardCollectionViewCell.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/19.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    static let  identifier = "CardCollectionViewCell"
    
    
    let movieImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ファンタスティックビースト")
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(movieImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieImageView.frame = contentView.bounds
    }

    
    public func configure(with model: String ){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {return}
        movieImageView.loadImage(with:url)
    }
    
}
