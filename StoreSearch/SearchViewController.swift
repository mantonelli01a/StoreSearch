//
//  SearchViewController.swift
//  StoreSearch
//
//  Created by Administrator on 01/07/2017.
//  Copyright © 2017 DoubleThunder. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var searchResults: [SearchResult] = []
    var hasSearched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchResults = []
        if searchBar.text! != "Justin bieber" {
            for i in 0...2 {
                let searchResult = SearchResult()
                searchResult.name = String(format: "Fake Result %d for", i)
                searchResult.artistName = searchBar.text!
                searchResults.append(searchResult)
            }
        }
        hasSearched = true
        tableview.reloadData()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasSearched {
            return 0
        } else if searchResults.count == 0 {
            return 1
        } else {
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchResultCell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
         if searchResults.count == 0 {
         cell.textLabel!.text = "(Nothing found)"
         cell.detailTextLabel!.text = ""
         } else {
         let searchResult = searchResults[indexPath.row]
         cell.textLabel!.text = searchResult.name
         cell.detailTextLabel!.text = searchResult.artistName
         }
        // cell.textLabel!.text = searchResults[indexPath.row]
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
}
