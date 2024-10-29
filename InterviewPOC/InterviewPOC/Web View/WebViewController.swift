//
//  WebViewController.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 29/10/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    private var url: URL?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        load()
    }
    
    func assignUrl(_ url: URL) {
        self.url = url
    }
    
    private func load() {
        if let url {
            webView.load(URLRequest(url: url))
        }
    }

}
