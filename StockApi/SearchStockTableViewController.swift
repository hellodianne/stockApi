//
//  SearchStockTableViewController.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/11/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import UIKit

class SearchStockTableViewController: UITableViewController {
    
    var stockList: [Stock] = [Stock]()
    var selectedStocks: [Stock] = [Stock]()
    var searchController: UISearchController!
    var resultsController = UITableViewController()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return self.selectedStocks.count
        } else {
             return self.stockList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            //let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell")
            let cell = UITableViewCell()
            let stock = selectedStocks[indexPath.row]
            cell.textLabel?.text = stock.name
            //cell?.detailTextLabel?.text = stock.name
            return cell
        } else {
            let cell = UITableViewCell()
            let stock = stockList[indexPath.row]
            cell.textLabel?.text = stock.name
            //cell.detailTextLabel?.text = stock.name
            return cell
        
        }
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableView {
            print("indexPath is \(indexPath)")
        } else {
            let stock = stockList[indexPath.row]
            //if stock not in selected yet then append
            if !selectedStocks.contains(stock){
                self.selectedStocks.append(stock)
                self.tableView.reloadData()
            }
        }
    }
}

extension SearchStockTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        //print(self.searchController.searchBar.text)
        if let query = searchController.searchBar.text, !query.isEmpty {
            let yahooParameters = ["region": "US", "lang": "en-US"]
            SecEdgarHelper.sharedInstance().sampleTaskforYahoo(query: query, parameters: yahooParameters){ stockList in
                self.stockList = stockList
                //print("newstocklist")
                //print(stockList)
                //self.tableView.reloadData()
                DispatchQueue.main.async {
                    self.resultsController.tableView.reloadData()
                }
            }
        }
    }
}




