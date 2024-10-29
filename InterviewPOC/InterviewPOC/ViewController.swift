//
//  ViewController.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func action(_ sender: Any) {
        pushToVC(toStoryboard: StoryBoard.main, toVC: NewsListViewController.self)
    }
    
}

