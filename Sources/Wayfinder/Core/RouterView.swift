//
//  RouterView.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

/// A SwiftUI-based navigation and presentation manager that conforms to the `Router` protocol.
///
/// `RouterView` provides a flexible and reusable way to manage navigation stacks, modals, sheets, alerts,
/// and custom transitions in a SwiftUI application. It integrates with the SwiftUI environment to allow
/// child views to access the `Router` for navigation and presentation purposes.
///
/// - Generic Parameter:
///   - `Content`: The type of the view content managed by the `RouterView`.
public struct RouterView<Content: View>: View, Router {
    
    // MARK: - Properties
    
    /// The dismiss action provided by the SwiftUI environment.
    @Environment(\.dismiss) private var dismiss

    /// The navigation stack for `NavigationStack`.
    @State private var path: [AnyDestination] = []
    
    /// The currently presented sheet destination.
    @State private var showSheet: AnyDestination? = nil
    
    /// The currently presented full-screen cover destination.
    @State private var showFullScreenCover: AnyDestination? = nil
    
    /// The currently presented alert.
    @State private var alert: AnyAppAlert? = nil
    
    /// The type of the currently presented alert.
    @State private var alertOption: AlertType = .alert
    
    /// The background color for the modal view.
    @State private var modalBackgroundColor: Color = Color.black.opacity(0.6)
    
    /// The transition animation for the modal view.
    @State private var modalTransition: AnyTransition = .opacity
    
    /// The currently presented modal destination.
    @State private var modal: AnyDestination? = nil
    
    /// A binding to the view stack from previous `RouterView` instances.
    @Binding var screenStack: [AnyDestination]
    
    /// A flag indicating whether to add a `NavigationView` to the content.
    var addNavigationView: Bool
    
    /// A closure that provides the content of the `RouterView`.
    @ViewBuilder var content: (Router) -> Content
    
    // MARK: - Initializer
    
    /// Creates a new `RouterView` instance.
    ///
    /// - Parameters:
    ///   - screenStack: An optional binding to the view stack from previous `RouterView` instances.
    ///   - addNavigationView: A flag indicating whether to add a `NavigationView` to the content. Defaults to `true`.
    ///   - content: A closure that provides the content of the `RouterView`.
    public init(
        screenStack: (Binding<[AnyDestination]>)? = nil,
        addNavigationView: Bool = true,
        content: @escaping (Router) -> Content
    ) {
        self._screenStack = screenStack ?? .constant([])
        self.addNavigationView = addNavigationView
        self.content = content
    }

    // MARK: - Body
    
    /// The body of the `RouterView`.
    public var body: some View {
        NavigationStackIfNeeded(path: $path, addNavigationView: addNavigationView) {
            content(self)
                .sheetViewModifier(screen: $showSheet)
                .fullScreenCoverViewModifier(screen: $showFullScreenCover)
                .showCustomAlert(type: alertOption, alert: $alert)
        }
        .modalViewModifier(screen: $modal, transition: modalTransition, backgroundColor: modalBackgroundColor)
        .environment(\.router, self)
    }
    
    // MARK: - Router Protocol Methods
    
    /// Navigates to a new screen based on the specified `SegueOption`.
    ///
    /// - Parameters:
    ///   - option: The segue option defining the navigation behavior.
    ///   - destination: A closure that provides the destination view.
    public func showScreen<T: View>(_ option: SegueOption, @ViewBuilder destination: @escaping (Router) -> T) {
        let screen = RouterView<T>(
            screenStack: option.shouldAddNewNavigationView ? nil : (screenStack.isEmpty ? $path : $screenStack),
            addNavigationView: option.shouldAddNewNavigationView
        ) { newRouter in
            destination(newRouter)
        }
        
        let destination = AnyDestination(destination: screen)
        
        switch option {
        case .push, .geniePush:
            if screenStack.isEmpty {
                path.append(destination)
            } else {
                screenStack.append(destination)
            }
        case .sheet:
            showSheet = destination
        case .fullScreenCover:
            showFullScreenCover = destination
        }
    }
    
    /// Dismisses the currently presented screen.
    public func dismissScreen() {
        dismiss()
    }
    
    /// Displays an alert with the specified parameters.
    ///
    /// - Parameters:
    ///   - option: The type of alert to display.
    ///   - title: The title of the alert.
    ///   - subtitle: An optional subtitle for the alert.
    ///   - buttons: An optional closure that provides the buttons for the alert.
    public func showAlert(_ option: AlertType, title: String, subtitle: String? = nil, buttons: (@Sendable () -> AnyView)? = nil) {
        self.alertOption = option
        self.alert = AnyAppAlert(title: title, subtitle: subtitle, buttons: buttons)
    }
    
    /// Dismisses the currently presented alert.
    public func dismissAlert() {
        alert = nil
    }
    
    /// Displays a modal with the specified parameters.
    ///
    /// - Parameters:
    ///   - transition: The transition animation for presenting the modal. Defaults to `.opacity`.
    ///   - backgroundColor: The background color of the modal. Defaults to a semi-transparent black color.
    ///   - destination: A closure that provides the destination view.
    public func showModal<T: View>(
        transition: AnyTransition = .opacity,
        backgroundColor: Color = Color.black.opacity(0.6),
        @ViewBuilder destination: @escaping () -> T
    ) {
        self.modalTransition = transition
        self.modalBackgroundColor = backgroundColor
        let destination = AnyDestination(destination: destination())
        self.modal = destination
    }
    
    /// Dismisses the currently presented modal.
    public func dismissModal() {
        modal = nil
    }
}
