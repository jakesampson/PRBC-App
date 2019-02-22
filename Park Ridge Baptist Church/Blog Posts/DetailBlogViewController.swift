//
//  DetailBlogViewController.swift
//  Park Ridge Baptist Church
//
//  Created by Jake Sampson on 5/2/19.
//  Copyright © 2019 Jake Sampson. All rights reserved.
//

import UIKit
import WebKit

class DetailBlogViewController: UIViewController {

    var webView: WKWebView!
    var detailItem: Post?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
        
        title = detailItem?.title.rendered
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem.content.rendered)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)

    }

}
