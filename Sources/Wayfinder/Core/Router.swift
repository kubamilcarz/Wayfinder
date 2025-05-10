//
//  Router.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

/// An extension to `EnvironmentValues` to provide a `Router` instance.
public extension EnvironmentValues {
    /// The router used for navigation and presentation within the app.
    ///
    /// By default, this is set to a `MockRouter` instance.
    @Entry var router: Router = MockRouter()
}

/// A protocol defining navigation and presentation behavior.
public protocol Router {
    /// Shows a screen with the specified segue option and destination view.
    ///
    /// - Parameters:
    ///   - option: The segue option defining the navigation behavior.
    ///   - destination: A closure that returns the destination view, which receives the `Router` as a parameter.
    func showScreen<T: View>(_ option: SegueOption, @ViewBuilder destination: @escaping (Router) -> T)
    
    /// Dismisses the currently presented screen.
    func dismissScreen()
    
    /// Shows an alert with the specified type, title, subtitle, and buttons.
    ///
    /// - Parameters:
    ///   - option: The type of alert to display.
    ///   - title: The title of the alert.
    ///   - subtitle: An optional subtitle for the alert.
    ///   - buttons: A closure that returns the buttons for the alert.
    func showAlert(_ option: AlertType, title: String, subtitle: String?, buttons: (@Sendable () -> AnyView)?)
    
    /// Dismisses the currently presented alert.
    func dismissAlert()
    
    /// Shows a modal with the specified transition, background color, and destination view.
    ///
    /// - Parameters:
    ///   - transition: The transition animation for presenting the modal.
    ///   - backgroundColor: The background color of the modal.
    ///   - destination: A closure that returns the destination view.
    func showModal<T: View>(transition: AnyTransition, backgroundColor: Color, @ViewBuilder destination: @escaping () -> T)
    
    /// Dismisses the currently presented modal.
    func dismissModal()
}

struct MockRouter: Router {
    func showScreen<T: View>(_ option: SegueOption, @ViewBuilder destination: @escaping (Router) -> T) {
        print("Mock router does not work.")
    }
    func dismissScreen() {
        print("Mock router does not work.")
    }
    
    func showAlert(_ option: AlertType, title: String, subtitle: String? = nil, buttons: (@Sendable () -> AnyView)? = nil) {
        print("Mock router does not work.")
    }
    
    func dismissAlert() {
        print("Mock router does not work.")
    }
    
    func showModal<T: View>(transition: AnyTransition, backgroundColor: Color, @ViewBuilder destination: @escaping () -> T) {
        print("Mock router does not work.")
    }
    
    func dismissModal() {
        print("Mock router does not work.")
    }
}
