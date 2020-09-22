//
//  HTTPPostEx1.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import Foundation
import UIKit

class HTTPPostEx1 {
    
    
    static func example1() {
        let jsonPayLoad = "{'username':'DevTechie', 'company' : 'DevTechie Ibteractive', 'overview' : 'Learn Fast'}"
        
        let urlString = "https://httpbin.org/post"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = jsonPayLoad.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            guard let data = data, let postResponse = String(data: data, encoding: String.Encoding.utf8) else {
                print("No data found.")
                return
            }
            print(postResponse)
        })
        //task.priority = 0.9
        task.resume()
    }
}
