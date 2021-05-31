//
//  UIWebViewPageViewController.swift
//  WebViewMenagerie
//
//  Created by Kyle Pointer on 31.05.21.
//

import UIKit

class UIWebViewPageViewController: UIViewController {
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(URLRequest(url: URL(string: "https://www.duckduckgo.com")!))
    }
}

