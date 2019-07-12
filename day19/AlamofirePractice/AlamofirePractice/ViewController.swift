//
//  ViewController.swift
//  AlamofirePractice
//
//  Created by Mahnoor Khan on 11/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = "https://jsonplaceholder.typicode.com/users"
        let request = Alamofire.request(url)
        request.responseJSON { (response) -> Void in
            if let json = response.result.value {
                let result = json as! NSArray
                if let temp = result[0] as? [String: Any] {
                    print( temp["name"] as! String)
                }
            }
        }
    }


}

