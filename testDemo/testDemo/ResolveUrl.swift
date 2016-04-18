//
//  ResolveUrl.swift
//  testDemo
//
//  Created by Zhao on 16/4/18.
//  Copyright © 2016年 com.travelchinaguide. All rights reserved.
//

import Foundation
import UIKit

typealias requestError = (error: NSError) -> Void
typealias requestSuccess = (dic: NSDictionary) -> Void

class ResolveUrl: NSObject, NSURLConnectionDataDelegate {
    
    var requestUrl: NSURL!
    var responseData: NSMutableData!
    var connect: NSURLConnection!
    var success: requestSuccess?
    
    init(url: String) {
        super.init()
        
        requestUrl = NSURL(string: "https://server.travelchinaguide.com/flight/service2.0/flightsdata.asp?t1=PEK&t2=CAN&d1=2016-04-19")
        let request = NSURLRequest(URL: requestUrl)
        connect = NSURLConnection(request: request, delegate: self)
        connect.start()
    }
    
    func setRequestData() {
        let request = NSURLRequest(URL: requestUrl)
        connect = NSURLConnection(request: request, delegate: self)
        connect?.start()
    }
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        responseData = NSMutableData()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        responseData.appendData(data)
//        print(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        do
        {
            let dic = try NSJSONSerialization.JSONObjectWithData(responseData, options: .AllowFragments)
//            print(dic)
            success!(dic: dic as! NSDictionary)
        }
        catch
        {
            
        }
        
        
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        
    }
    
    
}