//
//  HeaderUIView.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/17.
//

import UIKit

class HeaderUIView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "ファンタスティックビースト")
        return imageView
    }()
    
    
    let playButton:UIButton = {
        let button = UIButton()
        button.setTitle("再生", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    let myListButton:UIButton = {
        let button = UIButton()
        button.setTitle("マイリスト", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 12.0)
        return button
    }()
    let infoButton:UIButton = {
        let button = UIButton()
        button.setTitle("詳細情報", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 12.0)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addGradient()
        addSubview(playButton)
        addSubview(infoButton)
        addSubview(myListButton)
        applyConstraints()
    }
    
    private func applyConstraints(){
        playButton.anchor(bottom: self.bottomAnchor,paddingBottom: 20,
                          width: 100, height: 30)
        playButton.centerX(inView: self)
        
        infoButton.anchor( left: playButton.rightAnchor, paddingLeft: 10,
                           right: self.rightAnchor, paddingRight: 10,
                           bottom: self.bottomAnchor, paddingBottom: 20,
                           height: 30)
        myListButton.anchor(left: self.leftAnchor, paddingLeft: 10,
                            right: playButton.leftAnchor, paddingRight: 10,
                           bottom: self.bottomAnchor, paddingBottom: 20,
                           height: 30)
    }
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.black.cgColor
           
            
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
