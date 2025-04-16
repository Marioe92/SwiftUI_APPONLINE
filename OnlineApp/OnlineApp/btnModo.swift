//
//  btnModo.swift
//  OnlineApp
//
//  Created by Mario on 15/4/25.
//

import SwiftUI  // vista creada para reutilizar el boton en las vistas

struct btnModo: View {
    @Binding var isDarkMode: Bool

    var body: some View {
        Button(action: {
            isDarkMode.toggle()
        }) {
            Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
        }
    }
}
