//
//  VideoListScreen.swift
//  TableView
//
//  Created by Mahnoor Khan on 08/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class VideoListScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var videos : [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let header = UIView()
//        header.backgroundColor = UIColor.green
//        header.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
//        tableView.tableHeaderView = header
        
        tableView.delegate = self
        tableView.dataSource = self
        videos = createArray()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func createArray() -> [Video] {
        return [Video(image: UIImage (named: "beginner-first-app")!, title: "Your First App"),
                Video(image: UIImage(named: "dev-setup")!, title: "My Dev Setup"),
                Video(image: UIImage(named: "int-overview")!, title: "iOS Interview"),
                Video(image: UIImage(named: "ss-delegates")!, title: "Buttons in TableViews"),
                Video(image: UIImage(named: "ss-uipickerview-card")!, title: "UIPickerView Tutorials"),
                Video(image: UIImage(named: "vlog-4")!, title: "Day in the life "),
                ]
        
//        Video(image: UIImage (named: "beginner-first-app")!, title: "Your First App"),
//        Video(image: UIImage(named: "dev-setup")!, title: "My Dev Setup"),
//        Video(image: UIImage(named: "int-overview")!, title: "iOS Interview"),
//        Video(image: UIImage(named: "ss-delegates")!, title: "Buttons in TableViews"),
//        Video(image: UIImage(named: "ss-uipickerview-card")!, title: "UIPickerView Tutorials"),
//        Video(image: UIImage(named: "vlog-4")!, title: "Day in the life "),
//        Video(image: UIImage (named: "beginner-first-app")!, title: "Your First App"),
//        Video(image: UIImage(named: "dev-setup")!, title: "My Dev Setup"),
//        Video(image: UIImage(named: "int-overview")!, title: "iOS Interview"),
//        Video(image: UIImage(named: "ss-delegates")!, title: "Buttons in TableViews"),
//        Video(image: UIImage(named: "ss-uipickerview-card")!, title: "UIPickerView Tutorials"),
//        Video(image: UIImage(named: "vlog-4")!, title: "Day in the life ")
    }
}

extension VideoListScreen : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        
        
        cell.setVideo(video: video)
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let item = videos[indexPath.row]
        print(item.title)
        
    }
    
}
