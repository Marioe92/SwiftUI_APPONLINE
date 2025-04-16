import SwiftUI

struct ContentView: View {
    @StateObject var productVM = ProductViewModel()

    var body: some View {
        TabView {
            ProductListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }

            UserView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Cuenta")
                }

            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cesta")
                }
                .badge(productVM.contarCesta)
        }
        .environmentObject(productVM)
    }
}
