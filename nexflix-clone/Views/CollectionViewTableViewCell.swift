//
//  CollectionViewTableViewCell.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/17.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let  identifier = "CollectionViewTableViewCell"
    
    var movies = [Movie]()
    private let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 180)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        return cv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    
    public func configure(with movies:[Movie]){
        print("呼ばれてます",movies.count)
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension CollectionViewTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(movies[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        cell.backgroundColor = .black
        
        
        let model = movies[indexPath.row].poster_path ?? ""
        let title = movies[indexPath.row].original_title ?? movies[indexPath.row].original_name ?? "Unknow"
        
        
        cell.configure(with: model, title:title )
        
        return cell
    }
    
    
}
