
//
//  Product.swift
//  OnlineApp
//
//  Created by  on 10/4/25.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let image: String
    let rating: Rating //
}

struct Rating: Codable{  //Proporcionado profesora
    let rate:Double
    let count :Int
}
