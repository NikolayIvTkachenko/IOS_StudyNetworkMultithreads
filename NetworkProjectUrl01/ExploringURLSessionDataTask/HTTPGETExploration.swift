//
//  HTTPGETExploration.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import Foundation

class HTTPGETExploration {
    
    static func exploreDataTask(){
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let url = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=\(Manager.omdbKey)&s=harry")
        
        let task = session.dataTask(with: url!, completionHandler: {(data, response, error)  in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Status Code is not 200")
                return
            }
            
            guard let data = data else {
                print("data is empty")
                return
            }
            
            do {
                let moviewEnvelop = try JSONDecoder().decode(MovieEnvelope.self, from: data)
                guard let movies = moviewEnvelop.Search else {
                    print("No moview found")
                    return
                }
                
                for m in movies {
                    print(m.Title!)
                }
                
            }catch {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
}
