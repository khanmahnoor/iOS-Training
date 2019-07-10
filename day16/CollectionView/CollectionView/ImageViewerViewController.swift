//
//  ImageViewerViewController.swift
//  CollectionView
//
//  Created by Mahnoor Khan on 08/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }

    private func setupImageView() {
        guard let name = imageName else { return }
    
        if let image = UIImage(named: name) {
            imageView.image = image
        }
    }
}
