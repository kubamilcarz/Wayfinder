//
//  AnyDestination.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

/// A type-erased destination view that can be used in navigation or presentation contexts.
///
/// `AnyDestination` allows you to store and manage views of different types in a uniform way,
/// making it useful for dynamic navigation scenarios.
///
/// - Properties:
///   - `id`: A unique identifier for the destination, generated using `UUID`.
///   - `destination`: The type-erased view to be presented.
///
/// - Note: This struct conforms to `Hashable` to allow usage in collections or comparisons.
public struct AnyDestination: Hashable {
    /// A unique identifier for the destination.
    let id = UUID().uuidString

    /// The type-erased destination view.
    var destination: AnyView

    /// Initializes a new `AnyDestination` with the specified view.
    ///
    /// - Parameter destination: The view to be type-erased and stored.
    public init<T: View>(destination: T) {
        self.destination = AnyView(destination)
    }

    /// Hashes the essential components of the `AnyDestination` into the provided hasher.
    ///
    /// - Parameter hasher: The hasher to use when combining the components.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    /// Compares two `AnyDestination` instances for equality.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side `AnyDestination` to compare.
    ///   - rhs: The right-hand side `AnyDestination` to compare.
    /// - Returns: `true` if the two instances are equal, `false` otherwise.
    public static func == (lhs: AnyDestination, rhs: AnyDestination) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
