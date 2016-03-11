//
//  ViewController.swift
//  iOS-WKWebView
//
//  Created by afraz on 12/03/2016.
//  Copyright © 2016 punch. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var wkWebView: WKWebView!
    
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
            let myDict = NSDictionary(contentsOfFile: path)
            let strURL = myDict?.objectForKey("url")
            let useWK = myDict?.objectForKey("use_wk")
            
            let url = NSURL(string: strURL as! String)
            
            if useWK as! Bool
            {
                wkWebView.loadRequest(NSURLRequest(URL: url!))
                wkWebView.allowsBackForwardNavigationGestures = true
            }
            else
            {
                webView.loadRequest(NSURLRequest(URL: url!))
            }
            
            
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        
        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
            let myDict = NSDictionary(contentsOfFile: path)
            let useWK = myDict?.objectForKey("use_wk")
            
            if useWK as! Bool
            {
                wkWebView = WKWebView()
                wkWebView.navigationDelegate = self
                view = wkWebView
            }
            else
            {
                webView = UIWebView()
                view = webView
            }
        }
    }


}

