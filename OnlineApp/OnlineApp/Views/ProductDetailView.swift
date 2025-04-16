import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var productVM: ProductViewModel

    var body: some View {
        NavigationView {
            List(productVM.products) { product in
                NavigationLink(destination:
                        ProductDetailView(product: product)) {
                    HStack(spacing: 16) {
                        AsyncImage(url: URL(string: product.image)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                            } else if phase.error != nil {
                                Image(systemName: "photo")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.gray)
                            } else {
                                ProgressView()
                                    .frame(width: 60, height: 60)
                            }
                        }

                        Text(product.title)
                            .font(.body)
                            .lineLimit(2)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Productos")
        }
        .onAppear {
            if productVM.products.isEmpty {
                productVM.fetchProducts()
            }
        }
    }
}
