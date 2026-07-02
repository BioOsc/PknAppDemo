//
//  PokemonSegment.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import Foundation
import Alamofire

class PokemonSegment {
    
    private var Base_URL: String = ""
    
    init (to server: Server) {
        Base_URL = server.rawValue
    }
    
    func getPage(request: PkmPageRequest,_ onResult: @escaping (_ success: Bool, _ dataResponse: [PkmResult], _ errorResponse: PkmError?) -> ()) {
        
        let url: String = Base_URL + Endpoint.GET.pokemonGroup + "?offset=\(request.offset)&limit=\(request.limit)"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { result in
            switch (result.response!.statusCode) {
                case 200:
                    let object: PkmResponse<[PkmResult]> = try! JSONDecoder().decode(PkmResponse.self, from: result.data!)
                    onResult(true, object.results, nil)
                    break
                case 400:
                    let object: PkmError = PkmError(error: "Bad Request")
                    onResult(false, [], object)
                    break
                default:
                    onResult(false, [], nil)
                    break
            }
        })
    }
    
    func getDetail(request: PkmDetailRequest,_ onResult: @escaping (_ success: Bool, _ dataResponse: PkmDetailResponse?, _ errorResponse: PkmError?) -> ()) {
        
        let url: String = Base_URL + Endpoint.GET.pokemonDetail + "\(request.index)/"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { result in
            switch (result.response!.statusCode) {
                case 200:
                    let object: PkmDetailResponse = try! JSONDecoder().decode(PkmDetailResponse.self, from: result.data!)
                    onResult(true, object, nil)
                    break
                case 400:
                    let object: PkmError = PkmError(error: "Bad Request")
                    onResult(false, nil, object)
                    break
                default:
                    onResult(false, nil, nil)
                    break
            }
        })
    }
    
}
