//
//  AlertType.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

/// A structure representing a customizable application alert.
///
/// `AnyAppAlert` provides a flexible way to define alerts with a title, optional subtitle,
/// and customizable buttons. It conforms to `Sendable` to ensure thread safety.
///
/// - Properties:
///   - `title`: The main title of the alert.
///   - `subtitle`: An optional subtitle providing additional context.
///   - `buttons`: A closure that returns a type-erased view representing the alert's buttons.
///
/// - Initializers:
///   - `init(title:subtitle:buttons:)`: Creates an alert with a title, optional subtitle, and custom buttons.
///   - `init(error:)`: Creates an alert with a predefined title of "Error" and a subtitle derived from the error's localized description.
struct AnyAppAlert: Sendable {
    /// The main title of the alert.
    var title: String

    /// An optional subtitle providing additional context for the alert.
    var subtitle: String?

    /// A closure that returns a type-erased view representing the alert's buttons.
    var buttons: @Sendable () -> AnyView

    /// Initializes a new `AnyAppAlert` with the specified title, optional subtitle, and buttons.
    ///
    /// - Parameters:
    ///   - title: The main title of the alert.
    ///   - subtitle: An optional subtitle for the alert. Defaults to `nil`.
    ///   - buttons: A closure that returns the buttons for the alert. Defaults to an "OK" button.
    init(
        title: String,
        subtitle: String? = nil,
        buttons: (@Sendable () -> AnyView)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.buttons = buttons ?? {
            AnyView(
                Button("OK") { }
            )
        }
    }

    /// Initializes a new `AnyAppAlert` for an error.
    ///
    /// - Parameter error: The error to display in the alert. The error's localized description
    ///   is used as the subtitle.
    init(error: Error) {
        self.init(title: "Error", subtitle: error.localizedDescription, buttons: nil)
    }
}
