//
//  Detail.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import Foundation

struct PkmDetailResponse: Decodable {
    //MARK: This object was reducted from the full description
    let id: Int
    let name: String
    let height: Double
    let weight: Double
    let baseExperience: Int
    let abilities: [PKmAbilityResponse]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case height
        case weight
        case baseExperience = "base_experience"
        case abilities
    }
    
}

struct PkmAbility: Decodable {
    
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
}

struct PKmAbilityResponse: Decodable, Identifiable {
    
    let id: UUID = UUID()
    let ability: PkmAbility
    let isHidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
    
}

struct PkmDetailRequest {
    
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
}
