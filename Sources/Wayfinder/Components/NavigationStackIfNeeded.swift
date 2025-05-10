//
//  NavigationStackIfNeeded.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

struct NavigationStackIfNeeded<Content: View>: View {
    
    @Binding var path: [AnyDestination]
    var addNavigationView: Bool = true
    @ViewBuilder var content: Content
    
    var body: some View {
        if addNavigationView {
            NavigationStack(path: $path) {
                ZStack {
                    content
                        .navigationDestination(for: AnyDestination.self) { value in
                            value.destination
                        }
                }
            }
        } else {
            ZStack {
                content
            }
        }
    }
}
