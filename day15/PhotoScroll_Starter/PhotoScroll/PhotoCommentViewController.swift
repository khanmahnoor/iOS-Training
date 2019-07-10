//
//  PhotoCommentViewController.swift
//  PhotoScroll
//
//  Created by Mahnoor Khan on 05/07/2019.
//  Copyright © 2019 raywenderlich. All rights reserved.
//

import UIKit

class PhotoCommentViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var nameTextField: UITextField!
  var photoName : String?
  override func viewDidLoad() {
    super.viewDidLoad()
    if let photoName = photoName {
      self.imageView.image = UIImage(named: photoName)
    }
  }
    

}
