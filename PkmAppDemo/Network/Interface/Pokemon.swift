//
//  Pokemon.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//
import Foundation

struct PkmResult: Decodable, Identifiable {
    //MARK: This object was reducted from the full description
    let id: UUID = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
}

struct PkmPageRequest {
    
    let offset: Int
    let limit: Int
    
    init(offset: Int, limit: Int) {
        self.offset = offset
        self.limit = limit
    }
    
}
