//
//  SearchViewController.swift
//  iTunes
//
//  Created by 여성은 on 8/12/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SearchViewController: UIViewController {
    
    let searchController = {
        let view = UISearchController()
        view.searchBar.placeholder = "앱을 검색해 보세요"
        return view
    }()
    let tableView = {
        let view = UITableView()
        view.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        view.dataSource = nil
        view.delegate = nil
        view.rowHeight = 400
        return view
    }()
    let viewModel = SearchViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
        
    }
    func configure() {
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "검색"
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    func bind() {
        let input = SearchViewModel.Input(searchText: searchController.searchBar.rx.text.orEmpty,
                                          searchButtonTap: searchController.searchBar.rx.searchButtonClicked)
        let output = viewModel.transform(input: input)
//        
//        output.searchResultList
//            .asDriver(onErrorJustReturn: [])
//            .do(onDispose:  {
//                self.tableView.dataSource = nil
//                self.tableView.delegate = nil
//            })
//            .drive(tableView.rx.items(cellIdentifier: SearchResultTableViewCell.identifier, cellType: SearchResultTableViewCell.self)) { row, element, cell in
//                cell.configureCell(data: element)
//                let list = BehaviorRelay(value: element.screenshotUrls)
//                list
//                    .asDriver()
//                    .do {
//                        cell.collectionView.dataSource = nil
//                        cell.collectionView.delegate = nil
//                    }
//                    .drive(cell.collectionView.rx.items(cellIdentifier: SearchResultCollectionViewCell.identifier, cellType: SearchResultCollectionViewCell.self)) { item, element, cell in
//                        cell.configureUI(data: element)
//                    }
//                    .disposed(by: cell.disposeBag)
//            }
//            .disposed(by: disposeBag)
        
        output.searchResultList
                    .bind(to: tableView.rx.items(cellIdentifier: SearchResultTableViewCell.identifier, cellType: SearchResultTableViewCell.self)) { row, element, cell in
                        cell.configureCell(data: element)
                        let list = BehaviorRelay(value: element.screenshotUrls)
                        list
                            .bind(to: cell.collectionView.rx.items(cellIdentifier: SearchResultCollectionViewCell.identifier, cellType: SearchResultCollectionViewCell.self)) { item, element, cell in
                                cell.configureUI(data: element)
                            }
                            .disposed(by: cell.disposeBag)
                    }
                    .disposed(by: disposeBag)
    }
}
