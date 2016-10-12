//
//  Constants.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/5/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import Foundation

protocol Constant {
    
    var APIScheme: String {get}
    var APIHost: String {get}
    var APIPath: String {get}

}

struct YahooFinC: Constant {
    internal var APIPath: String = "/aq/autoc"
    internal var APIHost: String = "s.yimg.com"
    internal var APIScheme: String = "https"
}

struct LastTenKC: Constant {
    
    init(ticker: String) {
        symbol = ticker
        APIPath = "/v1/company/\(symbol)/ratios"
        APIHost = "services.last10k.com"
        APIScheme = "https"
    }
    
    var symbol = ""
    var APIPath = ""
    var APIHost = ""
    var APIScheme = ""
}




