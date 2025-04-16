import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var productVM: ProductViewModel

    var body: some View {
        NavigationView {
            List(productVM.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    HStack {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .frame(width: 80, height: 80)
                        }
                        
                       
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                                .lineLimit(1)
                            Text("€\(product.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Productos")
        }
        .onAppear {
            productVM.fetchProducts()
        }
    }
}
