//
//  Endpoint.swift
//  RMAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import Foundation

final class Endpoint {
    
    private init() {}
    //MARK: Segmentation may not be by Method but by action or object
    struct GET {
        static let pokemonGroup = "/pokemon"
        static let pokemonDetail = "/pokemon/"
        static let episodes = "/episode"
    }
    
}
