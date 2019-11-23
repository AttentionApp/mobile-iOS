//
//  UserProfileView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/10/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct UserProfileView: View {
    
    @EnvironmentObject private var globalState: GlobalState
    
    @State var userModel: UserModel?
    
    var body: some View {
          VStack(alignment: .center) {
            Text("Mi perfil").bold().font(.system(size: 30))
            Spacer().frame(height: 50)
            HStack() {
                Image("enfermera")
                .frame(width: 230, height: 200)
            }
            HStack {
              Text("Nombre: ").bold()
                Text("\(userModel?.first_name ?? "No name")")
            }
            HStack {
              Text("Apellido: ").bold()
              Text("\(userModel?.last_name ?? "No name")")
            }
            HStack {
              Text("Email: ").bold()
              Text("\(userModel?.email ?? "No email")")
            }
            Spacer()
          }
//          .onAppear(){
//            self.userModel = UserModel()
//            
//            UserAPI.data(){ res in
//                switch res {
//                    case .success:
//                        if let json = res.value{
//                            let datos = json["data"]
//                            self.userModel?.idcustomer = datos["idcustomer"].int ?? 0
//                            self.userModel?.first_name = datos["first_name"].string ?? "No firts name"
//                            self.userModel?.last_name = datos["last_name"].string ?? "No last name"
//                            self.userModel?.email = datos["email"].string ?? "No email"
//                        }
//                        case let .failure(error):
//                              print(error)
//                }
//            }
//        }
    }
    
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(userModel: UserModel())
    }
}
