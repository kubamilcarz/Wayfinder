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
    
}

@available(iOS 18.0, *)
extension View {
    
    // MARK: Genie Transition
    
    /// Applies a genie push transition to the view.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the transition.
    ///   - namespace: The namespace used for the matched geometry effect.
    /// - Returns: A view modified with the `GeniePushViewModifier`.
    func geniePush(id: String, namespace: Namespace.ID) -> some View {
        self.modifier(GeniePushViewModifier(id: id))
    }

    /// Marks the view as a target for a genie push transition.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the transition.
    ///   - namespace: The namespace used for the matched geometry effect.
    /// - Returns: A view modified with the `GeniePushTargetViewModifier`.
    func asGeniePushTarget(id: String, namespace: Namespace.ID) -> some View {
        self.modifier(GeniePushTargetViewModifier(id: id))
    }
}
