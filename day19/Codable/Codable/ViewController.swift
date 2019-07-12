//
//  ViewController.swift
//  Codable
//
//  Created by Mahnoor Khan on 11/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var users : [User] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        _ = User(id: 10, name: "Mahnoor Khan", username: "mahnoorkhan", email: "kmahnoor292@gmail.com", address: Address(street: "Shah Jahan", suite: "5", city: "Lahore", zipcode: "54000", geo: Geo(lat: "12.333", lng: "34.444")), phone: "03241019869", website: "mahnoorkhan.com", company: Company(name: "Mahnoor Co", catchPhrase: "LOLLL", bs: "hehe"))
        
//        let x = try? JSONEncoder().encode(user)
        // Do any additional setup after loading the view.
        doSomething()
    }
    
    func doSomething() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    self.users = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        // try to read out a string array
                        if let names = json[0]["name"] as? String {
                            print(names)
                        }
                    }
                } catch {
                    print(error)
                }
            }
            print(self.users.count)
        }
        dataTask.resume()
        print(self.users.count)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersCell") as! TableViewCell
        cell.setUser(user : user)
        return (cell)
    }
    
    
}
