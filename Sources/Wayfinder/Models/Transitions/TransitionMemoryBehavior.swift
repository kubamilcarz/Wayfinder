//
//  TransitionMemoryBehavior.swift
//  Wayfinder
//
//  Created by Nick Sarno on 4/19/25.
//

import Foundation
import SwiftUI

public enum TransitionMemoryBehavior: String {
    case removePrevious
    case keepPrevious
    
    var allowSimultaneous: Bool {
        switch self {
        case .removePrevious:
            return false
        case .keepPrevious:
            return true
        }
    }
    
}
