//
//  StockValueViewController.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/12/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import UIKit


class StockValueViewController: UIViewController {
    
    var StockFin: ParsedFinRatioCompany!

    override func viewDidLoad() {
        super.viewDidLoad()
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        StockFin = appDelegate.companyFin
        //having errors here in unwrapping div values
        //let Ivalue = DividendGrowthModel(financialRatio: StockFin, dr: 0.10)
        //print("Intrinsic Value is \(Ivalue)")

        
    }


}
