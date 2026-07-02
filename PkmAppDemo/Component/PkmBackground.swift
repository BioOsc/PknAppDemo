//
//  PkmBackground.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import SwiftUI

struct PkmBackground<Content>: View where Content: View {
    
    var content: () -> Content
    
    init(content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack(content: {
            //MARK: Add additional config for general usage
            content()
        })
    }
}

#Preview {
    PkmBackground(content: {
        VStack(content: {
            
        })
    })
}
