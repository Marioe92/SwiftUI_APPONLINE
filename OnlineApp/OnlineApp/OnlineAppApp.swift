//
//  OnlineAppApp.swift
//  OnlineApp
//
//  Created by  on 7/4/25.
//

import SwiftUI

@main
struct OnlineAppApp: App {
    @StateObject private var productVM = ProductViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(productVM)
        }
    }
}
