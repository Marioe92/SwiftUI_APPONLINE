import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var cart: [Product] = []

    func fetchProducts() {  // codigo sacado de internet: "https://es.stackoverflow.com/questions/453422/consumo-con-urlsession-y-clousure-respuesta-vacia-fuera-de-clousure"
        
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([Product].self, from: data) {
                    DispatchQueue.main.async {
                        self.products = decoded
                    }
                }
            }
        }.resume()
    }


    func anadirCesta(_ product: Product) {
        cart.append(product)
    }

    var contarCesta: Int {
        cart.count
    }

    
    var precioTotal: Double {
        cart.reduce(0) { $0 + $1.price }
    }
}
