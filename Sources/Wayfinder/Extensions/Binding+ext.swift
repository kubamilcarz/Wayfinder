//
//  Binding+ext.swift
//  Wayfinder
//
//  Created by Kuba on 5/10/25.
//

import SwiftUI

extension Binding where Value == Bool {
    
    init<T: Sendable>(ifNotNil alertTitle: Binding<T?>) {
        self.init {
            alertTitle.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                alertTitle.wrappedValue = nil
            }
        }
    }
}
