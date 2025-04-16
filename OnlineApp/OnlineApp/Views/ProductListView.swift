import SwiftUI



struct ProductListView: View {
    @EnvironmentObject var productVM: ProductViewModel
    @Binding var isDarkMode: Bool

    var body: some View {
        NavigationView {
            List(productVM.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    HStack(spacing: 15) {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                        } placeholder: {
                            ProgressView()
                        }

                        Text(product.title)
                            .font(.body)
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Productos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    btnModo(isDarkMode: $isDarkMode)
                }
            }
        }
        .onAppear {
            productVM.fetchProducts()
        }
    }
}

