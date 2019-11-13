//
//  NurseProfileView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/10/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

struct NurseProfileView: View {
    
    //var nurse : NurseModel
    
    let stringContratar:String = "Contratar"
    @EnvironmentObject private var globalState: GlobalState
    @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
          VStack(alignment: .center) {
            HStack(alignment: .top) {
              Image("enfermera")
            }
            HStack {
              Text("Nombre: ").bold()
               // Text("\(nurse.first_name)")
            }
            HStack {
              Text("Apellido: ").bold()
              //  Text("\(nurse.last_name)")
            }
            Spacer()
            Button(action: {}) {
                Text(stringContratar)
              }
            .scaledToFill()
              .frame(minWidth: 100, idealWidth: 200, maxWidth: 350)
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
          }
          .navigationBarTitle("Perfil de ")
        }
    }
}
struct NurseProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NurseProfileView()
    }
}

