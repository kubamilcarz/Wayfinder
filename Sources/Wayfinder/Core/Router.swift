//
//  Router.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

public extension EnvironmentValues {
    @Entry var router: Router = MockRouter()
}

public protocol Router {
    func showScreen<T: View>(_ option: SegueOption, @ViewBuilder destination: @escaping (Router) -> T)
    func dismissScreen()
    
    func showAlert(_ option: AlertType, title: String, subtitle: String?, buttons: (@Sendable () -> AnyView)?)
    func dismissAlert()
    
    func showModal<T: View>(transition: AnyTransition, backgroundColor: Color, @ViewBuilder destination: @escaping () -> T)
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
