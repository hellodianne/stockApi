//
//  ProfitabilityViewController.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/12/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import UIKit
import Charts

class ProfitabilityViewController: UIViewController {

    var StockFin: ParsedFinRatioCompany!
    
    @IBOutlet weak var lineChart: LineChartView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        StockFin = appDelegate.companyFin
        //print(GrossMargin)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setChart()
    }

    func setChart() {
        let GrossMargin = StockFin.GrossMargin
        var dataEntries: [ChartDataEntry] = []
        var count = 0
        for (year, value) in (GrossMargin?.historical)!{
            
            let dataEntry = ChartDataEntry(x: Double(count), y: value)
            dataEntries.append(dataEntry)
            count += 1
        }
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "Gross Margin")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChart.data = lineChartData
    }



}
