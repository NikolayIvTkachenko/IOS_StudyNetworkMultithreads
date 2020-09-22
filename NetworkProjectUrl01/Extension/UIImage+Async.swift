//
//  UIImage+Async.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    //imageV.image.downloadAsync(url)
    
    func downloadAsync(urlString: String) {
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            guard let response = response, let httpResponse = response as?
                HTTPURLResponse else {
                    print("Invalid response")
                    return
            }
            
            guard httpResponse.statusCode == 200 else {
                print("Invalid status code: \(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                print("No data found")
                return
            }
            
            let img = UIImage(data: data)
            DispatchQueue.main.async {
                self.image = img
            }
        })
        task.resume()
    }
    
}
