//
//  LiquidityViewController.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/12/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import UIKit
import Charts 

class LiquidityViewController: UIViewController {
    
    var StockFin: ParsedFinRatioCompany!
    
    @IBOutlet weak var lineChart: LineChartView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        StockFin = appDelegate.companyFin
        
        let GrossMargin = StockFin.GrossMargin
        print(GrossMargin?.historical)
        //print(GrossMargin)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //setChart()
        ChartHelper.sharedInstance().setChart(company: StockFin.GrossMargin!, label: "Gross Margin", lineChart: lineChart)
    }

}
