//
//  HTTPPostEx3.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import Foundation

class HTTPPostEx3 {
    
    static func example(){
        let urlString = "http://httpbin.org/post"
        let url = URL(string: urlString)
        var request = URLRequest(url:url!)
        request.httpMethod = "POST"
        do {
            let sample = SampleClass()
            sample.userName = "DevTesh"
            sample.age = 44
            sample.occupation = "Engineer"
            request.httpBody = try JSONEncoder().encode(sample)
        }catch{
            print(error.localizedDescription)
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            guard let data = data, let postResponse = String(data: data, encoding: String.Encoding.utf8) else {
                print("no data found")
                return
            }
            print(postResponse)
        })
        task.resume()
    }
    
    static func example(sample: SampleClass){
        let urlString = "http://httpbin.org/post"
        let url = URL(string: urlString)
        var request = URLRequest(url:url!)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONEncoder().encode(sample)
        }catch{
            print(error.localizedDescription)
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            guard let data = data, let postResponse = String(data: data, encoding: String.Encoding.utf8) else {
                print("no data found")
                return
            }
            print(postResponse)
        })
        task.resume()
    }
}

//--- Sample class---//
class SampleClass: Codable{
    var userName: String?
    var age: Int?
    var occupation: String?
}
