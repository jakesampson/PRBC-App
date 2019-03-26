//
//  GivingWebViewController.swift
//  Park Ridge Baptist Church
//
//  Created by Jake Sampson on 26/2/19.
//  Copyright © 2019 Jake Sampson. All rights reserved.
//

import UIKit
import WebKit

class GivingWebViewController: UIViewController, WKUIDelegate {

    
    
    @IBOutlet weak var givingWebView: WKWebView!
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.givenow.com.au/nhbcgg")
        let myRequest = URLRequest(url: myURL!)
        givingWebView.load(myRequest)
        
    }
    
    
    @IBAction func dismissViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
