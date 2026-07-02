//
//  PokemonList.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import SwiftUI

struct PokemonList: View {
    
    @State var currentPg: Int
    @State private var navFlag: Int? = 0
    
    @StateObject private var pkmVM: PkmListViewModel = PkmListViewModel()
    
    init() {
        self.currentPg = 1
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(pkmVM.pkmPage) { item in
                        /*NavigationLink(destination: CharacterDetail(characterID: char.id)) {
                            RMCharSheet(source: char)
                        }*/
                    }
                }
                .padding(25)
                .onAppear(perform: {
                    pkmVM.getBy(page: currentPg)
                })
            }
            HStack(alignment: .center, spacing: 10, content: {
                RMButton(title: LocalString.getFrom(key: KeyLocal.PokeList.btnPrev, in: .pokeList), action: {
                    if (currentPg > 1) {
                        currentPg = currentPg - 1
                        pkmVM.getBy(page: currentPg)
                    }
                }, height: 50, width: 80)
                Text("Pg\(currentPg)")
                    .font(.headline)
                RMButton(title: LocalString.getFrom(key: KeyLocal.PokeList.btnNext, in: .pokeList), action: {
                    currentPg = currentPg + 1
                    pkmVM.getBy(page: currentPg)
                }, height: 50, width: 80)
            })
            //NavigationLink("", destination: FavoriteCharacter(), tag: 1, selection: $navFlag)
        })
    }
    
}

#Preview {
    PokemonList()
}
