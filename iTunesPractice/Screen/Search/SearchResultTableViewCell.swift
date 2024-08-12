//
//  SearchResultTableViewCell.swift
//  iTunes
//
//  Created by 여성은 on 8/12/24.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchResultTableViewCell: UITableViewCell {
    static let identifier = "SearchResultTableViewCell"
    
    let infoView = {
        let view = UIView()
        return view
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemMint
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.isUserInteractionEnabled = true
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 16
        return button
    }()
    
    let stackview = UIStackView()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
        collectionView.register(SearchResultCollectionViewCell.self,
                                forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
        return collectionView
    }()
    let disposeBag = DisposeBag()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        contentView.addSubview(infoView)
        infoView.addSubview(appNameLabel)
        infoView.addSubview(appIconImageView)
        infoView.addSubview(downloadButton)
        contentView.addSubview(stackview)
        contentView.addSubview(collectionView)
        
        infoView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
        }
        appIconImageView.snp.makeConstraints {
            $0.centerY.equalTo(infoView.snp.centerY)
            $0.leading.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(appIconImageView)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-8)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalTo(appIconImageView)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(32)
            $0.width.equalTo(72)
        }
        stackview.snp.makeConstraints {
            $0.top.equalTo(stackview.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        
    }
    
    func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 16
        layout.itemSize = CGSize(width: width/3 , height: width*2)
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right:0)
        layout.scrollDirection = .horizontal
        return layout
        
    }
    func configureCell(data: SoftwareResult) {
        guard let url = URL(string: data.artworkUrl60) else { return }
        appIconImageView.kf.setImage(with: url)
        appNameLabel.text = data.trackCensoredName
  
    }
     
}
