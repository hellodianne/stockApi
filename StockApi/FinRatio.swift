//
//  FinRatio.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/10/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import Foundation

struct FinRatio {
    
    let historical: [String: Double]
    
    init?(dictionary: [String: Any]){
        
        var newhistorical: [String:Double] = [:]
        
        guard let oldhistorical = dictionary["Historical"] as? [String: Double],
        let currentDictionary = dictionary["Recent"] as? [String: Any]
        else {
            return nil
        }
        //Unwrapping TTM or Latest Qtr as key
        if let current = currentDictionary["TTM"] as? Double {
            newhistorical["2016"] = current
        }
        
        if let current = currentDictionary["Latest Qtr"] as? Double {
            newhistorical["2016"] = current
        }
        
        for (key, value) in oldhistorical {
            var dateArray = key.components(separatedBy: "-")
            newhistorical[dateArray[0]] = value
        }
        
        self.historical = newhistorical
    }
}

struct ParsedFinRatioCompany {
    
    let BookValuePerShare: FinRatio?
    let CurrentRatio: FinRatio?
    let GrossMargin: FinRatio?
    let ReturnOnAssets: FinRatio?
    let ReturnOnEquity: FinRatio?
    let DebtEquity: FinRatio?
    let FinancialLeverage: FinRatio?
    let Dividends: FinRatio?
    
    init?(dictionary: [String:Any]){
        
        if let BookValuePerShare = dictionary["BookValuePerShare"] as? [String: Any] {
            self.BookValuePerShare = FinRatio(dictionary: BookValuePerShare)
        } else {
            self.BookValuePerShare = nil
        }
        
        if let CurrentRatio = dictionary["CurrentRatio"] as? [String: Any] {
            self.CurrentRatio = FinRatio(dictionary: CurrentRatio)
        } else {
            self.CurrentRatio = nil
        }
        
        if let GrossMargin = dictionary["GrossMargin"] as? [String: Any] {
            self.GrossMargin = FinRatio(dictionary: GrossMargin)
        } else {
            self.GrossMargin = nil
        }
        if let ReturnOnAssets = dictionary["ReturnOnAssets"] as? [String: Any] {
            self.ReturnOnAssets = FinRatio(dictionary: ReturnOnAssets)
        } else {
            self.ReturnOnAssets = nil
        }
        
        if let ReturnOnEquity = dictionary["ReturnOnEquity"] as? [String: Any] {
            self.ReturnOnEquity = FinRatio(dictionary: ReturnOnEquity)
        } else {
            self.ReturnOnEquity = nil
        }
        
        if let DebtEquity = dictionary["DebtEquity"] as? [String: Any] {
            self.DebtEquity = FinRatio(dictionary: DebtEquity)
        } else {
            self.DebtEquity = nil
        }
        if let FinancialLeverage = dictionary["FinancialLeverage"] as? [String:Any] {
            self.FinancialLeverage = FinRatio(dictionary: FinancialLeverage)
        } else {
            self.FinancialLeverage = nil
        }
        
        if let Dividends = dictionary["Dividends"] as? [String:Any] {
            self.Dividends = FinRatio(dictionary: Dividends)
        } else {
            self.Dividends = nil
        }
    }

}
