//
//  HTTPPostEx2.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import Foundation
import UIKit

class HTTPPostEx2  {
    static func example(){
        var jsonDictionary = [String: Any]()
        jsonDictionary["username"] = "DevTechie"
        jsonDictionary["company"] = "DevTechie Interactive"
        jsonDictionary["userID"] = 123456789
        jsonDictionary["userAge"] = 44
        jsonDictionary["userHeight"] = 6.9
        
        
        let urlString = "http://httpbin.org/post"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: jsonDictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
        }catch {
            print(error.localizedDescription)
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            
            guard let data = data , let postResponse = String(data: data, encoding: String.Encoding.utf8) else {
                print("unable to parse data because not data is present")
                return
            }
            print(postResponse)
            
        })
        task.resume()
    }
}

