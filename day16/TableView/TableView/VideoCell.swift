//
//  VideoCell.swift
//  TableView
//
//  Created by Mahnoor Khan on 08/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {


    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    func setVideo(video : Video) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
}
