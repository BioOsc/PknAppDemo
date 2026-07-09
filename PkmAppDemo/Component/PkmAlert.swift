//
//  PkmAlert.swift
//  PkmAppDemo
//
//  Created by BioOsc on 09/07/26.
//

import SwiftUI
import Combine

struct PkmAlert<Content>: View where Content: View {
    
    var content: () -> Content
    var title: String
    var message: String
    var btnTitle: String
    var action: () -> ()
    
    @State var showAlert: Bool = false
    
    init(content: @escaping () -> Content, title: String = "Alert", message: String = "", buttonTitle: String = "Ok", action: @escaping () -> (), show: Bool) {
        self.content = content
        self.title = title
        self.message = message
        self.btnTitle = buttonTitle
        self.action = action
        self.showAlert = show
    }
    
    var body: some View {
        content()
            .alert(title, isPresented: $showAlert) {
                Button(btnTitle, role: .none) {
                    action()
                    showAlert = false
                }
                Button("Cancel", role: .cancel) {
                    showAlert = false
                }
            } message: {
                Text(message)
            }
    }
}

#Preview {
    PkmAlert(content: {
        VStack(content: {})
    }, action: {}, show: true)
}
