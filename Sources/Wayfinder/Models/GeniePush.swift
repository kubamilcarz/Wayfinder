//
//  GeniePush.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

/// A view modifier that applies a "genie push" transition effect to a source view.
///
/// This modifier uses a `matchedGeometryEffect` to create a seamless transition
/// between the source and target views. It is available on iOS 18 and later.
///
/// - Note: Ensure that the `id` matches between the source and target views to enable the transition.
///
/// - Parameters:
///   - namespace: A `Namespace` used to link the source and target views.
///   - id: A unique identifier for the transition effect.
@available(iOS 18.0, *)
struct GeniePushViewModifier: ViewModifier {
    @Namespace var namespace
    var id: String
    
    func body(content: Content) -> some View {
        content
            .matchedGeometryEffect(id: id, in: namespace)
    }
}

/// A view modifier that applies a "genie push" transition effect to a target view.
///
/// This modifier uses the `navigationTransition` API with a `.zoom` animation
/// to create a smooth transition from the source view. It is available on iOS 18 and later.
///
/// - Note: Ensure that the `id` matches between the source and target views to enable the transition.
///
/// - Parameters:
///   - namespace: A `Namespace` used to link the source and target views.
///   - id: A unique identifier for the transition effect.
@available(iOS 18.0, *)
struct GeniePushTargetViewModifier: ViewModifier {
    @Namespace var namespace
    var id: String
    
    func body(content: Content) -> some View {
        content
            .navigationTransition(.zoom(sourceID: id, in: namespace))
    }
}
