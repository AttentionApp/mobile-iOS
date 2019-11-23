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
    
    @State var userModel: UserModel
    
    
    var btnBack : some View { Button(action: {
        self.presentation.wrappedValue.dismiss()
        }) {
            HStack {
            Image(systemName: "arrow.left")
                .aspectRatio(contentMode: .fit)
                Text("Go back")
            }
        }
    }
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Text(nurseModel.short_name).bold().font(.system(size: 30))
            }
            Spacer().frame(height: 50)
            HStack {
                ImageView(withURL: nurseModel.thumbnail_image)
                .frame(width: 230, height: 200)
            }
            HStack {
              Text("Nombre: ").bold()
                Text("\(nurseModel.first_name)")
            }
            HStack {
              Text("Apellido: ").bold()
              Text("\(nurseModel.last_name)")
            }
            HStack(alignment: .center) {
                Text("Descripción: ").bold()
                Text("\(nurseModel.description)")
            }
            Spacer().frame(height: 50)
            
            NavigationLink(destination: ContractNurse(nurseModel: nurseModel, userModel: userModel), isActive: $showView){
                Button(action: {
                    self.showView = true
                    print(self.userModel)
                }) {
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
        .navigationBarTitle(Text("Perfil de \(nurseModel.short_name)"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}
struct NurseProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NurseProfileView(nurseModel: NurseModel(),userModel: UserModel())
    }
}

