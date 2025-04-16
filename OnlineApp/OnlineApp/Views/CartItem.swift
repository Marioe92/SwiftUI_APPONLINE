//
//  CartItem.swift
//  OnlineApp
//
//  Created by  on 14/4/25.
//

import Foundation
struct CartItem: Identifiable {
    let id: Int
    let product: Product
    var quantity: Int

    var precioTotal: Double {// funcion para sumar el precio de todos los productos al total de la cesta
        
        return Double(quantity) * product.price
    }
}
