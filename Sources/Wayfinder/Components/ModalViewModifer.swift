//
//  ModalViewModifer.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

struct ModalSupportView<Content: View>: View {
    
    var backgroundColor = Color.black.opacity(0.6)
    var transition: AnyTransition = .opacity
    @Binding var showModal: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            if showModal {
                backgroundColor
                    .ignoresSafeArea()
                    .transition(.opacity.animation(.smooth))
                    .onTapGesture {
                        showModal = false
                    }
                    .zIndex(1)
                
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .transition(transition)
                    .zIndex(2)
            }
        }
        .zIndex(999)
        .animation(.bouncy, value: showModal)
    }
}

extension View {
    
    func modalViewModifier(screen: Binding<AnyDestination?>, transition: AnyTransition = .opacity, backgroundColor: Color = Color.black.opacity(0.6)) -> some View {
        self
            .overlay(
                ModalSupportView(backgroundColor: backgroundColor, transition: transition, showModal: Binding(ifNotNil: screen)) {
                        ZStack {
                            if let screen = screen.wrappedValue {
                                screen.destination
                            }
                        }
                    }
            )
    }
}
