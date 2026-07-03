//
//  Response.swift
//  RMAppDemo
//
//  Created by BioOsc on 02/07/26.
//

struct PkmResponse<T: Decodable>: Decodable {
    
    let count: Int
    let next: String?
    let previous: String?
    let results: T
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
}

struct PkmError: Decodable {
    
    let error: String
    
    enum CodingKeys: String, CodingKey {
        case error
    }
    
}
