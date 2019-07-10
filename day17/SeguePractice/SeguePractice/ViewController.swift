//
//  ViewController.swift
//  SeguePractice
//
//  Created by Mahnoor Khan on 09/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? ShowSegueViewController
        {
            vc.text = "Arthur Dent"
        }
    }
    
    @IBAction func showSegueButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "pushSegue", sender: "hello")
    }

}

