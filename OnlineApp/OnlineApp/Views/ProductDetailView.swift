import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var productVM: ProductViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 250)
                } placeholder: {
                    ProgressView()
                }

                Text(product.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: index < Int(product.rating.rate.rounded()) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                    Text("(\(product.rating.count))")
                        .foregroundColor(.gray)
                        .font(.caption)
                }

                Button(action: {
                    productVM.anadirCesta(product)
                }) {
                    Text("€\(product.price, specifier: "%.2f") - Añadir a la cesta")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}
