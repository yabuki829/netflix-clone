//
//  TitleTableViewCell.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/20.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let  identifier = "TitleTableViewCell"
    
    let thumbnailsImageView:UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode  = .scaleAspectFill
        imageview.layer.cornerRadius = 10
        imageview.clipsToBounds = true
        return imageview
    }()
    let dateStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    let releaseDateMonthLabel:UILabel = {
        //release_date
        let label = UILabel()
        label.text = "02"
        label.font =  UIFont(name: "Avenir-Light", size: 12.0)
        label.textAlignment = .center
        label.textColor = .lightGray
        return  label
    }()
    let releaseDateDayLabel:UILabel = {
        let label = UILabel()
        label.text = "09"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return  label
    }()
    let titleLabel:UILabel = {
        let label = UILabel()
        return  label
    }()
    
    let infoLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        
        return  label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(thumbnailsImageView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoLabel)
        
        contentView.addSubview(dateStackView)
        dateStackView.addArrangedSubview(releaseDateMonthLabel)
        dateStackView.addArrangedSubview(releaseDateDayLabel)
        
        applyConstraints()
    }
    
    
    func applyConstraints(){
        dateStackView.anchor(top: self.topAnchor, paddingTop: 20,
                                left: self.leftAnchor, paddingLeft: 0,width: 80)
        
        thumbnailsImageView.anchor(top: self.topAnchor, paddingTop: 20,
                                   left: releaseDateMonthLabel.rightAnchor, paddingLeft:0,
                                   right: self.rightAnchor, paddingRight: 10,
                                   height: 200)
        
        titleLabel.anchor(top: thumbnailsImageView.bottomAnchor, paddingTop: 10,
                          left: self.leftAnchor, paddingLeft: 80,
                          right:self.rightAnchor , paddingRight: 10
                       )
        infoLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 5,
                         left: self.leftAnchor, paddingLeft: 80,
                         right: self.rightAnchor, paddingRight: 10,
                         bottom: self.bottomAnchor, paddingBottom: 10)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func convert(dateString:String) -> [String]{
//        "2021-02-09" -> ["2021","02","09"]
        let s:[String] = dateString.components(separatedBy: "-")
        return s
    }
    public func configure(with movie: Movie ){
        
        guard let modal = movie.backdrop_path else { return }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(modal)") else {return}
        guard let info = movie.overview else { return }
        guard let date = movie.release_date else { return }
        guard let title = movie.original_title else { return }
        
        thumbnailsImageView.loadImage(with:url)
        infoLabel.text = info
        let dateString = convert(dateString: date)
        releaseDateMonthLabel.text = "\(dateString[1])月"
        releaseDateDayLabel.text = dateString[2]
        
        titleLabel.text = title
        
    }
    
}
