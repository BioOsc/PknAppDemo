//
//  PkmListViewModel.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import Foundation
import Combine

class PkmListViewModel: ObservableObject {
    
    @Published var pkmPage: [PkmResult] = []
    @Published var pkmDetail: PkmDetailResponse?
    @Published var isLoading = false
    
    private var api: RequestAPI = RequestAPI.shared
    
    init() {
        getBy(page: 1)
    }
    
    func getBy(page: Int) {
        isLoading = true
        let offset: Int = (page - 1) * 20
        api.pokemon.getPage(request: PkmPageRequest(offset: offset, limit: 20), { success, object, error in
            if (success) {
                self.pkmPage = object
                //MARK: Secuencial request is allowed but not optimal!.
                /*for elm in object {
                    self.getDetail(index: self.getInnerID(pokemon: elm))
                }*/
            }
            self.isLoading = false
        })
    }
    
    func getDetail(index: Int) {
        api.pokemon.getDetail(request: PkmDetailRequest(index: index), { success, object, error in
            if (success) {
                self.pkmDetail = object
            }
            self.isLoading = false
        })
    }
    //MARK: URL transformation to ID
    func getInnerID(pokemon: PkmResult) -> Int {
        var resource: String = pokemon.url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        resource = resource.replacingOccurrences(of: "/", with: "")
        
        return Int(resource)!
    }
    
}
