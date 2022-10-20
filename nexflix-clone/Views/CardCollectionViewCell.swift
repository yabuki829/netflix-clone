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
        return imageView
    }()
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.layer.zPosition = -1
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(movieImageView)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieImageView.frame = contentView.bounds
        titleLabel.frame = contentView.bounds
    }

    
    public func configure(with model: String,title:String ){
        
        titleLabel.text = title
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {return}
        movieImageView.loadImage(with:url)
    }
    
}
