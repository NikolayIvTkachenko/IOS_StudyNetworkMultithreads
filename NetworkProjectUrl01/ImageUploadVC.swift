//
//  ImageUploadVC.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import UIKit

class ImageUploadVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, URLSessionDelegate {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var uploadStatus: UILabel!
    
    var imagePickerController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
    }
    

    @IBAction func btnPickImage(_ sender: Any) {
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func btnUploadImage(_ sender: Any) {
        //upload task will go here
        self.uploadImageToServer(imageToUpload: self.imageV.image!)
    }
    
    
    //MARK: image picker controller delegate function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickerImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.imageV.image = pickerImage
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: upload task function
    func uploadImageToServer(imageToUpload: UIImage){
        let imageData = imageToUpload.jpegData(compressionQuality: 1.0)
        let uploadEndpoint = URL(string: "http://127.0.0.1:5000/upload")
        
        var request = URLRequest(url: uploadEndpoint!)
        request.httpMethod = "POST"
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue())
        
        session.uploadTask(with: request, from: imageData, completionHandler: {(data, response, error) in
            
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            guard let data = data else {
                return
            }

            let res = String(data: data, encoding: String.Encoding.utf8)
            print(res)
            }).resume()
    }
}

extension ImageUploadVC: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let progress = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
        print(progress)
        DispatchQueue.main.async {
            self.progressBar.progress = progress
            self.uploadStatus.text = "\(progress * 100)"
            if progress > 0.95 {
                self.uploadStatus.text = "100"
            }
        }
    }
    
}
