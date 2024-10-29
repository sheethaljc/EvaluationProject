//
//  NewsListViewController.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import UIKit

class NewsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let interacter = NewsListInteracter() // view model

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // refresh the data in each time of appearance
        Task {
            await self.populateNews()
        }
    }
    
    fileprivate func registerCell() {
        NewListTableViewCell.registerCell(on: tableView)
    }
    
    func populateNews() async {
        do {
            try await interacter.fetchNews()
        } catch {
            if let networkError = error as? NetworkErrors {
                switch networkError {
                case .emptyData:
                    // Handle error
                    break
                case .invalidUrl:
                    // Handle error
                    break
                }
            } else {
                // parsing error, etc
                // Handle error
            }
        }
        tableView.reloadData()
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interacter.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewListTableViewCell = tableView.dequeueReusableCell(withIdentifier: NewListTableViewCell.cellIDentifier, for: indexPath) as! NewListTableViewCell
        if let item = interacter.results?[indexPath.row] {
            cell.title.text = item.title
            cell.content.text = item.description
            cell.date.text = Utility.displayDate(item.pubDate)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = interacter.results?[indexPath.row], let link = item.link, let url = URL(string: link) else {
            return
        }
        pushToVC(toStoryboard: StoryBoard.main, toVC: WebViewViewController.self) { vc in
            if let vc = vc as? WebViewViewController {
                vc.assignUrl(url)
            }
        }
    }
    
    
}


