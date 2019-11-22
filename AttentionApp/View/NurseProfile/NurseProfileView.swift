//
//  NurseProfileView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/10/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON
import UIKit
struct NurseProfileView: View {
        
    let stringContratar:String = "Contratar"
    @EnvironmentObject private var globalState: GlobalState
    @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>
    
    @State var showView = false
    
    var nurseModel: NurseModel
    
    var body: some View {
        NavigationView {
          VStack(alignment: .center) {
            HStack(alignment: .top) {
              Image("enfermera")
            }
            HStack {
              Text("Nombre: ").bold()
                Text("\(nurseModel.first_name)")
            }
            HStack {
              Text("Apellido: ").bold()
              Text("\(nurseModel.last_name)")
            }
            Spacer()
            
            NavigationLink(destination: ContractNurse(), isActive: $showView){
                Button(action: {self.showView = true}) {
                    Text(stringContratar)
                }
                .scaledToFill()
                  .frame(minWidth: 100, idealWidth: 200, maxWidth: 350)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            
          }
          .navigationBarTitle("Perfil de \(nurseModel.short_name)")
        }
    }
}
struct NurseProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NurseProfileView(nurseModel: NurseModel())
    }
}

