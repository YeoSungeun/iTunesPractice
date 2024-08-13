//
//  SearchResultCollectionViewCell.swift
//  iTunesPractice
//
//  Created by 여성은 on 8/12/24.
//

import UIKit
import SnapKit
import Kingfisher
import RxSwift

final class SearchResultCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchResultCollectionViewCell"
    var disposeBag = DisposeBag()
    
    let screenshotImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureHierarchy() {
        contentView.addSubview(screenshotImageView)
        
    }
    func configureLayout() {
        screenshotImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    func configureView() {
        backgroundColor = .lightGray
    }
    
    func configureUI(data: String) {
        guard let url = URL(string: data) else { return }
        screenshotImageView.kf.setImage(with: url)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
}
