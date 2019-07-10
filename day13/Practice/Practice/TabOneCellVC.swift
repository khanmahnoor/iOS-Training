//
//  TabOneCellVC.swift
//  Practice
//
//  Created by Mahnoor Khan on 03/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class TabOneCellVC: UITableViewCell {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rollNo: UILabel!
 
    // MARK: - Properties
    var cell: TabOneCell? {
        didSet {
            guard let cell = cell else { return }
            name.text = cell.name
            rollNo.text = cell.rollNo
        }
    }
    
    
}
