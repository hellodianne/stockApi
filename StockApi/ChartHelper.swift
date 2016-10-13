//
//  ChartHelper.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/13/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ChartHelper {
    
    // MARK: Charts
    func setChart(company: FinRatio, label: String, lineChart: LineChartView) {
        var dataEntries: [ChartDataEntry] = []
        var count = 0
        for (year, value) in (company.historical){
            
            let dataEntry = ChartDataEntry(x: Double(count), y: value)
            dataEntries.append(dataEntry)
            count += 1
        }
        //print(dataEntries)
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: label)
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChart.data = lineChartData
        
        
    }
    
    class func sharedInstance() -> ChartHelper {
        struct Singleton {
            static var sharedInstance = ChartHelper()
        }
        return Singleton.sharedInstance
    }



}

