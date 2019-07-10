//
//  ShowSegueViewController.swift
//  SeguePractice
//
//  Created by Mahnoor Khan on 09/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class ShowSegueViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
//    var text : String! {
//        didSet {
//            label.text = text
//        }
//    }
    var text : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text//"yellow yellow dirty fellow"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
