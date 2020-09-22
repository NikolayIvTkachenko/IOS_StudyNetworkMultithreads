//
//  UploadTaskExample.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import Foundation

import UIKit

class UploadTaskExample {
    
    static func uploadExample(){
        let imageToUpload = UIImage(named: "Networking")
        let imageData = imageToUpload?.jpegData(compressionQuality: 1.0)
        let uploadEndpoint = URL(string: "http://127.0.0.1:5000/upload")
        
        var request = URLRequest(url: uploadEndpoint!)
        request.httpMethod = "POST"
        URLSession.shared.uploadTask(with: request, from: imageData, completionHandler: {(data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                return
            }
            
            let response = String(data: data, encoding: String.Encoding.utf8)
            print(response)
            }).resume()
        
    }
    
}
