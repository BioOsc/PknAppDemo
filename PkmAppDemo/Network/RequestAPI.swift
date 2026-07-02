//
//  RequestAPI.swift
//  RMAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import Foundation
import Alamofire

enum Server: String {//If are url's per environment put them here.
    case pkmAPI = "https://pokeapi.co/api/v2"
}

class RequestAPI {
    
    var pokemon: PokemonSegment!
    
    private init () {
        let server: Server = .pkmAPI
        
        pokemon = PokemonSegment(to: server)
    }
    
    static var shared: RequestAPI = {
        return RequestAPI()
    }()
    
}
