//
//  AlertType.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

/// An enumeration representing different types of alerts.
///
/// `AlertType` defines whether an alert should be displayed as a standard alert
/// or as a confirmation dialog.
///
/// - Cases:
///   - `alert`: Represents a standard alert.
///   - `confirmationDialog`: Represents a confirmation dialog with multiple options.
public enum AlertType {
    case alert
    case confirmationDialog
}
