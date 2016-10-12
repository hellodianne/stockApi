//
//  ViewController.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/4/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var stockList: [Stock] = [Stock]()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let yahooParameters = ["region": "US", "lang": "en-US"]
//        stockList = SecEdgarHelper.sharedInstance().sampleTaskforYahoo(query: "apple", parameters: yahooParameters)
        //print(stockList)
        //SecEdgarHelper.sharedInstance().sampleTaskforSecFiling(ticker: "pep")
    }
    
    //search task
    
    
    //Search Bar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
    
    //MARK: Table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stockList.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell")
        let stock = stockList[indexPath.row]
        cell?.textLabel?.text = stock.ticker
        cell?.detailTextLabel?.text = stock.name
        return cell!
        
    }
}


//extension ViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        print(searchController.searchBar.text)
//        if let query = searchController.searchBar.text, !query.isEmpty {
//            let yahooParameters = ["region": "US", "lang": "en-US"]
//            SecEdgarHelper.sharedInstance().sampleTaskforYahoo(query: query, parameters: yahooParameters){ stockList in
//                self.stockList = stockList
//                print(stockList)
//                self.tableView.reloadData()
//            }
//        }
//    }
//}

