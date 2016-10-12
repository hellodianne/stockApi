//
//  SecEdgarClient.swift
//  StockApi
//
//  Created by Dianne Katrina Bronola on 10/4/16.
//  Copyright © 2016 Dianne Bronola. All rights reserved.
//

import Foundation

class SecEdgarHelper: NSObject {
    
    func taskForGetMethod(urlPath: URL, completionHander:@escaping (_ success: Bool, _ data: Data?, _ error: String?)->Void) {
        
        let request = NSMutableURLRequest(url: urlPath)
        request.httpMethod = "GET"
        request.setValue("68acb9654d3044f8bd2df712718e262f", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            
            func processError(error: String) {
                print(error)
                completionHander(false,nil,error)
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                processError(error: "There was an error with your request: \(error)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode , statusCode >= 200 && statusCode <= 299 else {
                processError(error: "Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                processError(error: "No data was returned by the request!")
                return
            }
            completionHander(true,data as Data,nil)
            
        }
        task.resume()
    }
    
    
    // MARK: Yahoo Methods
    
    func parseYFinData(data: Data, completion: ([Stock])->Void){
        var stockList = [Stock]()
        let parsedResult = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
        
        if let dictionary = parsedResult as? [String: Any] {
            if let resultSet = dictionary["ResultSet"] as? [String: Any] {
                if let query = resultSet["Result"] as? [[String:Any]] {
                    for object in query {
                        let stock = Stock(dictionary:object)
                        if stock?.typeDisplay == "Equity" && (stock?.exchange == "NYSE" || stock?.exchange == "NASDAQ"){
                            stockList.append(stock!)
                        }
                    }
                }
            }
        }
        completion(stockList)
    }


    
    func sampleTaskforYahoo(query: String, parameters: [String:String], completion: @escaping ([Stock])->Void) {
        var newparameters = parameters
        newparameters["query"] = query
        let url = URLFromParameters(parameters: newparameters, constant: YahooFinC() as Constant)
        taskForGetMethod(urlPath: url) {success, data, error in
            guard (error == nil) else {
                print("error yahoo")
                return
            }
            
            guard let data = data else {
                return
            }
            
            if success {
                self.parseYFinData(data: data) {stockList in
                    completion(stockList)
                }
            }
            
        }
    
    }
    
    // MARK: Last10K Methods
    func parseSecData(data: Data){
        
        let parsedResult = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)

        if let dictionary = parsedResult as? [String: Any] {
            let financialRatio = parsedFinRatioCompany(dictionary: dictionary)
            print(DividendGrowthModel(financialRatio: financialRatio!, dr: 0.10))
        }
    
    
    }
    func sampleTaskforSecFiling(ticker: String) {
        
        let tkConstant = LastTenKC(ticker: ticker)
        let url = URLFromParameters(parameters: nil, constant: tkConstant)
        taskForGetMethod(urlPath: url) {success, data, error in
            guard(error == nil) else {
                print("error in sec")
                return
            }
            guard let data = data else {
                return
            }
            
            if success {
                //parse data here
                self.parseSecData(data: data)
                //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue))
            }
        }
    
    
    }
    
    // MARK: Helper for Creating a URL from Parameters
    
    func URLFromParameters(parameters: [String:String]?, constant: Constant) -> URL {
        
        let components = NSURLComponents()
        components.scheme = constant.APIScheme
        components.host = constant.APIHost
        components.path = constant.APIPath
        components.queryItems = [NSURLQueryItem]() as [URLQueryItem]?
        
        
        if let parameters = parameters {
            for (key, value) in parameters {
                let queryItem = NSURLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem as URLQueryItem)
            }
        }
        
        return components.url!
    }
    
    class func sharedInstance() -> SecEdgarHelper {
        
        struct Singleton {
            static var sharedInstance = SecEdgarHelper()
        }
        return Singleton.sharedInstance
    }
}

