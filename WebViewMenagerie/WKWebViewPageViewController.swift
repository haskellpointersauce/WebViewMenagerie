//
//  WKWebViewPageViewController.swift
//  WebViewMenagerie
//
//  Created by Kyle Pointer on 31.05.21.
//

import UIKit
import WebKit

class WKWebViewPageViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://www.duckduckgo.com")!))
    }
}
