//
//  UserProfileView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/10/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        NavigationView {
          VStack(alignment: .center) {
            HStack(alignment: .top) {
              Image("enfermera")
            }
            HStack {
              Text("Nombre: ").bold()
              Text("")
            }
            HStack {
              Text("Apellido: ").bold()
              Text("")
            }
            HStack {
              Text("Email: ").bold()
              Text("")
            }
            Spacer()
          }
          .navigationBarTitle("Acerca de ")
        }.onAppear(){
            
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
