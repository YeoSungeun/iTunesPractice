//
//  SearchViewController.swift
//  iTunes
//
//  Created by 여성은 on 8/12/24.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let tableView = {
        let view = UITableView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
      let a = NetworkManager.shared.callBoxOffice(term: "카카오")
        a.subscribe(with: self) { owner, response in
            print(response)
        }
        .dispose()
            
    }
}
