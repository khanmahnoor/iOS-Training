//
//  ViewController.swift
//  URLSession
//
//  Created by Mahnoor Khan on 10/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

struct Response: Codable { // or Decodable
    let foo: String
}

class ViewController: UIViewController {
    
    @IBAction func onGetTapped(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
//                    if let jsonString = try String(data: data, encoding: .utf8) {
//                        print(jsonString)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

    @IBAction func onPostTapped(_ sender: Any) {
        
        let parameters = ["username" : "@mahnoorkhan69", "tweet" : "Hello World"]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpbody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpbody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

