//
//  Movie.swift
//  NetworkProjectUrl01
//
//  Created by Nikolay Tkachenko on 12.08.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import Foundation

class MovieEnvelope: Codable {
    var Search: [Movie]?
}

class Movie: Codable {
    var Title: String?
    var Year: String?
    var Poster: String?
}
