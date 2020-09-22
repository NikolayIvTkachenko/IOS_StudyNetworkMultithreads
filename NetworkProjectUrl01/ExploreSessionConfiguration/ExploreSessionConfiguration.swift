//
//  ExploringSession.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import Foundation
import UIKit

class ExploreSessionConfiguration {
    
    static func exploreShareSession(){
        let shareSession = URLSession.shared
        print(shareSession.configuration.timeoutIntervalForRequest)
        
        //try to change timeout
        shareSession.configuration.timeoutIntervalForRequest = 10
        print("after: \(shareSession.configuration.timeoutIntervalForRequest)")
        
    }
    
    static func exploreDefaultSession(){
        let defaultSession = URLSessionConfiguration.default
        defaultSession.allowsCellularAccess = false
        defaultSession.timeoutIntervalForRequest = 10
        if #available(iOS 11.0, *) {
            defaultSession.waitsForConnectivity = true
        } else {
            
        }
        
        let session = URLSession(configuration: defaultSession)
        print(session.configuration.allowsCellularAccess)
        print(session.configuration.timeoutIntervalForRequest)
        if #available(iOS 11.0, *) {
            print(session.configuration.waitsForConnectivity)
        } else {
            // Fallback on earlier versions
        }
        
        
        
//        print("before: \(defaultSession.allowsCellularAccess)")
//        let session = URLSession(configuration: defaultSession)
//        session.configuration.allowsCellularAccess = false
//        print("after: \(session.configuration.allowsCellularAccess)")
        
    }
    
    static func exploreEphemeralSession(){
        let ephemeralConfig = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: ephemeralConfig)
        
    }
    
    static func exploreBackgroundSession(){
        let backgroundConfig = URLSessionConfiguration.background(withIdentifier: "com.rsh.sessioncon")
        let session = URLSession(configuration: backgroundConfig)
        
    }
    
}
