import SwiftUI

struct CartView: View {
    @EnvironmentObject var productVM: ProductViewModel
    @Binding var isDarkMode: Bool

    var body: some View {
        NavigationView {
            VStack {
                if productVM.cart.isEmpty {
                    Text("Tu cesta está vacía.")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                } else {
                    List {
                        ForEach(productVM.cart) { product in
                            HStack {
                                Text(product.title)
                                Spacer()
                                Text("€\(product.price, specifier: "%.2f")")
                            }
                        }
                        .onDelete(perform: removeItem)
                    }

                    HStack {
                        Text("Total:")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Text("€\(productVM.precioTotal, specifier: "%.2f")")
                            .font(.title2)
                            .bold()
                    }
                    .padding()
                }
            }
            .navigationTitle("Cesta")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    btnModo(isDarkMode: $isDarkMode)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }

    private func removeItem(at offsets: IndexSet) {
        for index in offsets {
            let product = productVM.cart[index]
            if let indexToRemove = productVM.cart.firstIndex(where: { $0.id == product.id }) {
                productVM.cart.remove(at: indexToRemove)
            }
        }
    }
}
