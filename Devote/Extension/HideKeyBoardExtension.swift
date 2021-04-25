//
//  HideKeyBoardExtension.swift
//  Devote
//
//  Created by Manoel Filho on 24/04/21.
//

import SwiftUI

/*
 Este código serve como um dismiss para o campo de texto da tela principal. SwiftUI ainda não tinnha opção para fechar.
 */

#if canImport(UIKit)
extension View {
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

