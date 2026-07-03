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
    let abilities: [PkmAbilityResponse]
    let sprites: PkmSprite
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case height
        case weight
        case baseExperience = "base_experience"
        case abilities
        case sprites
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

struct PkmAbilityResponse: Decodable, Identifiable {
    
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

struct PkmSprite: Decodable {
    
    let back_default: String?
    let back_female: String?
    let back_shiny: String?
    let back_shiny_female: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
    
    enum CodingKeys: String, CodingKey {
        case back_default
        case back_female
        case back_shiny
        case back_shiny_female
        case front_default
        case front_female
        case front_shiny
        case front_shiny_female
    }
    
}

struct PkmDetailRequest {
    
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
}
