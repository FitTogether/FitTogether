//
//  ViewController.swift
//  jsonTest
//
//  Created by Matthew Whitesides on 11/6/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate {

    lazy var data = NSMutableData()
    
    func initConnection() {
        let urlPath: String = "104.131.104.20/pages/testDB/"
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func buttonAction(sender: UIButton!){
        initConnection()
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println(jsonResult)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initConnection()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

