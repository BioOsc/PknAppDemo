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
    @Published var isLoading = false
    
    private var api: RequestAPI = RequestAPI.shared
    
    init() {
        getBy(page: 1)
    }
    
    func getBy(page: Int) {
        isLoading = true
        let offset: Int = page * 20
        api.pokemon.getPage(request: PkmPageRequest(offset: offset, limit: 20), { success, object, error in
            if (success) {
                self.pkmPage = object
            }
            self.isLoading = false
        })
    }
    
}
