//
//  PkmButton.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import SwiftUI

struct RMButton: View {
    
    var title: String
    var action: () -> Void
    var height: CGFloat
    var width: CGFloat
    
    init(title: String, action: @escaping () -> Void, height: CGFloat = 40, width: CGFloat = 180) {
        self.title = title
        self.action = action
        self.height = height
        self.width = width
    }
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .frame(width: width, height: height)
                .background(Color.accent)
                .foregroundColor(.theme)
        })
        .cornerRadius(height / 2)
        .overlay(RoundedRectangle(cornerRadius: height / 2)
                .stroke(.theme, lineWidth: 2)
        )
    }
}

#Preview {
    RMButton(title: "Demo", action: {})
}
