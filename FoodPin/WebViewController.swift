//
//  WebViewController.swift
//  FoodPin
//
//  Created by Joe on 2019/1/13.
//  Copyright © 2019 Joe. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController : UIViewController {

    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "http://andyron.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    override func loadView() {
        webView = WKWebView()
        view = webView
    }
}
