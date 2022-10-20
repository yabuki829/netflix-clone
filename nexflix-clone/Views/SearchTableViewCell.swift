//
//  SearchTableViewCell.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/20.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    static let  identifier = "SearchTableViewCell"
    
    let thumbnailsImageView:UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode  = .scaleAspectFill
        imageview.layer.cornerRadius = 5
        imageview.clipsToBounds = true
        return imageview
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        return  label
    }()
    let playButton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    public func configure(with movie:Movie){
        guard let thumbailUrl = movie.backdrop_path else{ return}
        print(thumbailUrl)
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(thumbailUrl)") else {return}
        thumbnailsImageView.loadImage(with: url)
        titleLabel.text = movie.original_title ?? movie.original_name ?? "Unknow"        
    }
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(thumbnailsImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        applyConstraints()
    }
    func applyConstraints(){
        thumbnailsImageView.anchor(top: self.topAnchor, paddingTop: 5,
                                   left: self.leftAnchor, paddingLeft: 0,
                                   bottom: self.bottomAnchor, paddingBottom: 5,
                                   width:150)
        titleLabel.anchor(top: self.topAnchor, paddingTop: 0,
                          left: thumbnailsImageView.rightAnchor, paddingLeft: 10,
                          bottom: self.bottomAnchor, paddingBottom: 0)
        playButton.anchor(left: titleLabel.rightAnchor, paddingLeft: 10,
                          right: self.rightAnchor, paddingRight: 10,
                          width: 40, height: 40)
        
        playButton.centerY(inView: contentView)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
