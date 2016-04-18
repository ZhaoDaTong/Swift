//
//  ViewController.swift
//  testDemo
//
//  Created by Zhao on 16/4/8.
//  Copyright © 2016年 com.travelchinaguide. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, NSURLConnectionDataDelegate {

    var arr = [UILabel]()
    var responseData: NSMutableData!
    var connect: NSURLConnection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        毛玻璃界面
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .Light)
        let blurView : UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
//        blurView.alpha = 0.5
//        blurView.frame = CGRect(x: 0, y: 100, width: 20, height: 20)
        blurView.frame = CGRect(x: 0, y: 150, width: 100, height: 50)
        self.view.addSubview(blurView)
        
        let label: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "kkkkk"
        label.textColor = UIColor.blueColor()
//        self.view.addSubview(label)
        //CALayer没有进行保存，会被销毁
        arr.append(label)
        
        self.view.layer.addSublayer(label.layer)
        
//        self.httpRequest()
        
        let request = ResolveUrl(url: "kk")
        request.success = { (dic: NSDictionary) -> Void in
            print( "haha" ,dic)
        }
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.httpRequest()
    }
    
    func httpRequest() {
        let url = NSURL(string: "https://server.travelchinaguide.com/flight/service2.0/flightsdata.asp?t1=PEK&t2=CAN&d1=2016-04-19")
        let request = NSURLRequest(URL: url!)
        connect = NSURLConnection(request: request, delegate: self)
        connect?.start()
        
        
    }
    
    @IBAction func btnClick(sender: AnyObject)
    {
        connect?.cancel()
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        responseData = NSMutableData()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        responseData.appendData(data)
        print(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        do
        {
            let dic = try NSJSONSerialization.JSONObjectWithData(responseData, options: .AllowFragments)
            print(dic)
        }
        catch
        {
            
        }
        
        
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "test" {
            let toView = segue.destinationViewController
            toView.modalPresentationStyle = .Popover
            toView.popoverPresentationController?.delegate = self
        }
    }
}

func testMesuar() {
    for a in 1...1000 {
        print(a)
    }
}
