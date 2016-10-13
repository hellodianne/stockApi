//
//  IntrinsicValue.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/10/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import Foundation

struct DividendGrowthModel {
    
    let intrinsicValue10: Double

    init?(financialRatio: ParsedFinRatioCompany, dr: Double){
        
        guard let dividends = financialRatio.Dividends else {
            return nil
        }
        //WARNING NOT ALL COMPANIES HAS DIVIDENDS
        let firstDiv = dividends.historical["2006"]
        let secondDiv = dividends.historical["2015"]
        let base = Double(secondDiv!)/firstDiv!
        let power = 1.0/10.0
        let growth = ((pow(base, power)) - 1.0)
        
        let currentDiv = dividends.historical["2016"]
        let intrinsicValue10 = currentDiv!/(dr - growth)
        
//        print("firstDiv is \(firstDiv)")
//        print("secondDiv is \(secondDiv)")
//        print("currentDiv is \(currentDiv)")
//        print("base is \(base)")
//        print("growth is \(growth)")
        
        self.intrinsicValue10 = intrinsicValue10
    
    }

}

