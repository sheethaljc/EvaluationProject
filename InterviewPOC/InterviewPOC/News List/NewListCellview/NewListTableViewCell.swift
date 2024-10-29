//
//  NewListTableViewCell.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import UIKit

class NewListTableViewCell: UITableViewCell {
    static let nibName = "NewListTableViewCell"
    static let cellIDentifier = "NewListTableViewCell"
    
    static func registerCell(on tableView: UITableView) {
        
        tableView.register(UINib(nibName: NewListTableViewCell.nibName,
                                 bundle: Bundle(for: Self.self)),
                           forCellReuseIdentifier: NewListTableViewCell.cellIDentifier)
    }
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
