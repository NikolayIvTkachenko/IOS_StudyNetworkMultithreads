//
//  DownloadTaskExample.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import Foundation

class DownloadTaskExample {
    
    private lazy var session: URLSession = {
       
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        let session = URLSession.init(configuration: config)
        return session
        
    }()
    
    private lazy var documentsDir: URL? = {
        
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first
        return documentsUrl
    }()
    
    func downloadFile(from url: URL, completion: @escaping (URL?) -> Void){
    
        let request = URLRequest(url: url)
        session.downloadTask(with: request, completionHandler: {(tempUrl, response, error) in
            
            guard error == nil else {
                completion(nil)
                print(error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil)
                return
            }
            
            if response.statusCode != 200 {
                completion(nil)
                return
            }
            
            guard let tempURL = tempUrl else {
                completion(nil)
                return
            }
            do {
                
                let destinationLoaction = self.documentsDir?.appendingPathComponent(tempURL.lastPathComponent)
                
                try FileManager.default.copyItem(at: tempURL, to: destinationLoaction!)
                completion(destinationLoaction)
                
            }catch let err{
                print(err.localizedDescription)
                completion(nil)
            }
            
            }).resume()
        
    }
    
}
