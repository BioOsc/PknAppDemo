//
//  PkmDetailViewModel.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import Foundation
import Combine

class PkmDetailViewModel: ObservableObject {
    
    @Published var pkmDetail: PkmDetailResponse?
    @Published var isLoading = false
    
    private var api: RequestAPI = RequestAPI.shared
    
    init(id: Int) {
        getBy(id: id)
    }
    
    func getBy(id: Int) {
        isLoading = true
        api.pokemon.getDetail(request: PkmDetailRequest(index: id), { success, object, error in
            if (success) {
                self.pkmDetail = object
            }
            self.isLoading = false
        })
    }
    
}
