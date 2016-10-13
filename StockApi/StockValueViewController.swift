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
        //let Ivalue = DividendGrowthModel(financialRatio: StockFin, dr: 0.10)
        //print("Intrinsic Value is \(Ivalue)")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
