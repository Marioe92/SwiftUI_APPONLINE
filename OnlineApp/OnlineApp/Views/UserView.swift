//
//  UserView.swift
//  OnlineApp
//
//  Created by  on 14/4/25.
//

//
//  UserView.swift
//  ios_app_eventos
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct UserView: View {
    
    @State private var user = Usuario(id: 1, name: "Mario", apellido: "Argote", email: "mario.argote@ikasle.egibide.org")
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Bienvenido/a, \(user.name) \(user.apellido)")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Correo electrónico: \(user.email)")
                    .font(.body)
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding()
            .navigationTitle("Mi Cuenta")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
