//
//  ContentView.swift
//  OnlineApp
//
//  Created by  on 15/4/25.
//


import SwiftUI

struct ContentView: View {
    @StateObject var productVM = ProductViewModel()
    @State private var isDarkMode = false

    var body: some View {
        TabView {
            ProductListView(isDarkMode: $isDarkMode)
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }

            UserView(isDarkMode: $isDarkMode)
                .tabItem {
                    Image(systemName: "person")
                    Text("Cuenta")
                }

            CartView(isDarkMode: $isDarkMode)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cesta")
                }
                .badge(productVM.contarCesta)
        }
        .environmentObject(productVM)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

