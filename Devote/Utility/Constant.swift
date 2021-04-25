//
//  Constant.swift
//  Devote
//
//  Created by Manoel Filho on 24/04/21.
//

import SwiftUI

//MARK: - FORMATTER
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//MARK: - UI
var backgroundGradient: LinearGradient{
    return LinearGradient(
        gradient: Gradient(colors: [Color.green, Color.blue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

//MARK: - UX

let feedback = UINotificationFeedbackGenerator()
