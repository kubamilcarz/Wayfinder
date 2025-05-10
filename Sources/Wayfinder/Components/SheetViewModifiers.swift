//
//  SheetViewModifiers.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

extension View {
    
    func sheetViewModifier(screen: Binding<AnyDestination?>) -> some View {
        self
            .sheet(isPresented: Binding(ifNotNil: screen)) {
                ZStack {
                    if let screen = screen.wrappedValue {
                        screen.destination
                    }
                }
            }
    }
    
    func fullScreenCoverViewModifier(screen: Binding<AnyDestination?>) -> some View {
        self
            .fullScreenCover(isPresented: Binding(ifNotNil: screen)) {
                ZStack {
                    if let screen = screen.wrappedValue {
                        screen.destination
                    }
                }
            }
    }
    
    // MARK: Genie Transition
    @available(iOS 18.0, *)
    func geniePush(id: String, namespace: Namespace.ID) -> some View {
        self.modifier(GeniePushViewModifier(id: id))
    }
    
    @available(iOS 18.0, *)
    func asGeniePushTarget(id: String, namespace: Namespace.ID) -> some View {
        self.modifier(GeniePushTargetViewModifier(id: id))
    }
}
