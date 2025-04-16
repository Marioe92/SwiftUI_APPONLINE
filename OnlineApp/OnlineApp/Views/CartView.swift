import SwiftUI

struct CartView: View {
    @EnvironmentObject var productVM: ProductViewModel
    //@EnvironmentObject var product: Product
    
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
                                AsyncImage(url: URL(string: product.image)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 80)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                Spacer()

                                Text(product.title)
                                Spacer()
                                Text("€\(product.price, specifier: "%.2f")")
                            }
                        }
                        .onDelete(perform: borrarProducto)
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
                EditButton() //btn para borrar el producto
            }
        }
    }


    private func borrarProducto(at offsets: IndexSet) { // funcion sacada de chatGPT
        for index in offsets {
            let product = productVM.cart[index]
            if let indexToRemove = productVM.cart.firstIndex(where: { $0.id == product.id }) {
                productVM.cart.remove(at: indexToRemove)
            }
        }
    }
}


