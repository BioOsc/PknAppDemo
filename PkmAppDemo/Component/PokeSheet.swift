//
//  PokeSheet.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import SwiftUI

struct PokeSheet: View {
    
    var content: PkmResult
    
    init(source: PkmResult) {
        self.content = source
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8, content: {
            Text(content.name)
                .font(.title3)
                .foregroundColor(.contrast)
                .frame(maxWidth: .infinity, minHeight: 60)
            //ToDo: Display image if is included in response
        })
        .background(Color.baseBG)
        .frame(maxWidth: .infinity, maxHeight: 60)
        .cornerRadius(8)
    }
    
}

#Preview {
    PokeSheet(source: PkmResult(name: "Demo", url: "https://pokeapi.co/api/v2/pokemon/17/"))
}
