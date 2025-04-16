
//
//  artViewModel.swift
//  OnlineApp
//
//  Created by  on 7/4/25.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []

    func addToCart(_ product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            let newItem = CartItem(id: product.id, product: product, quantity: 1)
            items.append(newItem)
        }
    }

    func borrarProducto(_ product: Product) {
        items.removeAll { $0.product.id == product.id }
    }

    func borrarProducto(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    var total: Double {
        items.reduce(0) { $0 + $1.precioTotal }
    }

    var totalProducto: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
}
