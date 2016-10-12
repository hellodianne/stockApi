//
//  Stock.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/5/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import Foundation

struct Stock: Equatable {
    
    struct Keys {
        static let Name = "name"
        static let Ticker = "symbol"
        static let Exchange = "exchDisp"
        static let TypeDisplay = "typeDisp"
    }
    
    let name: String
    let ticker: String
    let exchange: String
    let typeDisplay: String
    
    init?(dictionary: [String: Any]) {
        guard let name = dictionary[Keys.Name] as? String,
        let ticker = dictionary[Keys.Ticker] as? String,
        let exchange = dictionary[Keys.Exchange] as? String,
        let typeDisplay = dictionary[Keys.TypeDisplay] as? String
            else {
                return nil
        }
        self.name = name
        self.ticker = ticker
        self.exchange = exchange
        self.typeDisplay = typeDisplay
    }
}

func == (lhs: Stock, rhs: Stock) -> Bool {
    return lhs.ticker == rhs.ticker
}
