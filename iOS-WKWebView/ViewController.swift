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
    
    @IBOutlet weak var reloadButton: UIButton?
    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var containerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
            let myDict = NSDictionary(contentsOfFile: path)
            let strURL = myDict?.objectForKey("url")
            textField!.text = strURL as? String;
            
            self.reloadButtonTaped(reloadButton!);
            
            containerView?.frame = CGRectMake(0, 33, (containerView?.frame.size.width)!, (containerView?.frame.size.height)!)
            
//            let url = NSURL(string: strURL as! String)
//            
//            if useWK as! Bool
//            {
//                wkWebView.loadRequest(NSURLRequest(URL: url!))
//                wkWebView.allowsBackForwardNavigationGestures = true
//            }
//            else
//            {
//                webView.loadRequest(NSURLRequest(URL: url!))
//            }
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
    
    @IBAction func reloadButtonTaped(sender: UIButton)
    {
        let strURL = textField?.text
        
        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
            let myDict = NSDictionary(contentsOfFile: path)
            let useWK = myDict?.objectForKey("use_wk")
            
            let url = NSURL(string: strURL!)
            
            if useWK as! Bool
            {
                if ((containerView?.superview) != nil)
                {
                    containerView?.removeFromSuperview()
                }
                wkWebView.addSubview(containerView!)
                wkWebView.loadRequest(NSURLRequest(URL: url!))
                wkWebView.allowsBackForwardNavigationGestures = true
            }
            else
            {
                if ((containerView?.superview) != nil)
                {
                    containerView?.removeFromSuperview()
                }
                webView.addSubview(containerView!)
                webView.loadRequest(NSURLRequest(URL: url!))
            }
        }
    }
}

