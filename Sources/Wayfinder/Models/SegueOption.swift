//
//  SegueOption.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

/// An enumeration that defines different types of navigation transitions or presentation styles.
///
/// - `push`: A standard navigation push transition.
/// - `geniePush`: A custom push transition with a "zoom" animation, available for iOS 18 and later.
/// - `sheet`: A modal presentation that slides up from the bottom.
/// - `fullScreenCover`: A modal presentation that covers the entire screen.
public enum SegueOption {
    case push, geniePush, sheet, fullScreenCover

    /// A computed property that determines whether a new `NavigationView` should be added
    /// for the given segue option.
    ///
    /// - Returns: `true` if a new `NavigationView` should be added, `false` otherwise.
    var shouldAddNewNavigationView: Bool {
        switch self {
        case .push, .geniePush:
            return false
        case .sheet, .fullScreenCover:
            return true
        }
    }
}
