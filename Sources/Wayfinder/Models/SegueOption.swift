//
//  SegueOption.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

public enum SegueOption {
    case push, geniePush, sheet, fullScreenCover
    
    var shouldAddNewNavigationView: Bool {
        switch self {
        case .push, .geniePush:
            return false
        case .sheet, .fullScreenCover:
            return true
        }
    }
}
