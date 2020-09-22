//
//  ViewController.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ExploreSessionConfiguration.exploreShareSession()
        //ExploreSessionConfiguration.exploreDefaultSession()
        //HTTPGETExploration.exploreDataTask()
        
        //HTTPPostEx1.example1()
        //HTTPPostEx2.example()
        
//        HTTPPostEx3.example()
//        let sample = SampleClass()
//        sample.userName = "Nick"
//        sample.age = 40
//        sample.occupation = "Programmer"
//        HTTPPostEx3.example(sample: sample)
        
//        imageV.downloadAsync(urlString: "https://openclipart.org/image/800px/svg_to_png/223096/Nikola-Tesla-Age-34-Circa-1890.png")
        
        
        //UploadTaskExample.uploadExample()
        
        DownloadTaskExample().downloadFile(from: URL(string: "https://openclipart.org/image/800px/svg_to_png/223096/Nikola-Tesla-Age-34-Circa-1890.png")!, completion: {(url) in
            guard let url = url else {
                return
            }
            
            
            //neeed save to diosk
            DispatchQueue.main.async {
                let data = try! Data(contentsOf: url)
                self.imageV.image = UIImage(data: data)
            }
            
        })
        
        
    }


}

