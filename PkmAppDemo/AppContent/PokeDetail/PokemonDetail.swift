//
//  PokemonDetail.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import SwiftUI
import MapKit

struct PokemonDetail: View {
    
    var pokeID: Int
    
    @State private var navFlag: Int? = 0
    @State private var favorite: Bool
    @State private var pkmVM: PkmDetailViewModel
    
    init(pokeID: Int) {
        self.pokeID = pokeID
        pkmVM = PkmDetailViewModel(id: pokeID)
        favorite = MemoryManager.shared.characterIsFavorite(ref: pokeID)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            HStack(alignment: .center, spacing: 10, content: {
                Text(pkmVM.pkmDetail?.name ?? "")
                    .font(.largeTitle)
                if (favorite) {
                    Image(.star)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.yellow)
                        .frame(width: 30, height: 30)
                }
            })
            AsyncImage(url: URL(string: pkmVM.pkmDetail?.sprites.front_default ?? "")) { image in
                image.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 80, maxHeight: 80)
            }
            VStack(alignment: .center, spacing: 10, content: {
                HStack(alignment: .center, spacing: 10, content: {
                    Text(LocalString.format(value: pkmVM.pkmDetail?.height ?? 0, with: KeyLocal.PokeDetail.txtHeight, in: .pokeDetail))
                        .font(.title2)
                    Text(LocalString.format(value: pkmVM.pkmDetail?.weight ?? 0, with: KeyLocal.PokeDetail.txtWeight, in: .pokeDetail))
                        .font(.title2)
                })
            })
            Text(LocalString.format(value: pkmVM.pkmDetail?.baseExperience ?? 0, with: KeyLocal.PokeDetail.txtExpBase, in: .pokeDetail))
                .font(.title2)
            Text(LocalString.getFrom(key: KeyLocal.PokeDetail.txtAbilities, in: .pokeDetail))
                .font(.title)
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(pkmVM.pkmDetail!.abilities) { item in
                        Text(item.ability.name)
                            .font(.title2)
                    }
                }
                .padding(25)
            }
            HStack(alignment: .center, spacing: 10, content: {
                RMButton(title: LocalString.getFrom(key: favorite ? KeyLocal.PokeDetail.btnRmvFav : KeyLocal.PokeDetail.btnAddFav, in: .pokeDetail), action: {
                    if (favorite) {
                        MemoryManager.shared.removeFavorite(ref: pokeID)
                        favorite = false
                    } else {
                        favorite = MemoryManager.shared.setFavorite(ref: pokeID)
                    }
                }, width: favorite ? 120 : 100)
            })
        })
    }
}

#Preview {
    PokemonDetail(pokeID: 380)
}
