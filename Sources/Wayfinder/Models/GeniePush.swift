//
//  GeniePush.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

@available(iOS 18.0, *)
struct GeniePushViewModifier: ViewModifier {
    @Namespace var namespace
    var id: String
    
    func body(content: Content) -> some View {
        content
            .matchedGeometryEffect(id: id, in: namespace)
    }
}

@available(iOS 18.0, *)
struct GeniePushTargetViewModifier: ViewModifier {
    @Namespace var namespace
    var id: String
    
    func body(content: Content) -> some View {
        content
            .navigationTransition(.zoom(sourceID: id, in: namespace))
    }
}
