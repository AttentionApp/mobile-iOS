//
//  HomeView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/10/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var globalState: GlobalState
    @State var userModel: UserModel?
    
    var body: some View {
            TabView{
                NurseListView(userModel: userModel).tabItem(){
                    Image("ic_nurse_black_24dp")
                    Text("Enfermeras")
                }
                ReservationsView(userModel: userModel).tabItem(){
                    Image(systemName: "square.and.pencil")
                    Text("Mis reservas")
                }
                UserProfileView(userModel: userModel).tabItem(){
                    Image(systemName: "person.fill")
                    Text("Mi cuenta")
                }
            }
            .onAppear(){
                 self.userModel = UserModel()
                           
                           UserAPI.data(){ res in
                               switch res {
                                   case .success:
                                       if let json = res.value{
                                           let datos = json["data"]
                                           self.userModel?.idcustomer = datos["idcustomer"].int ?? 0
                                           self.userModel?.first_name = datos["first_name"].string ?? "No firts name"
                                           self.userModel?.last_name = datos["last_name"].string ?? "No last name"
                                           self.userModel?.email = datos["email"].string ?? "No email"
                                       }
                                       case let .failure(error):
                                             print(error)
                               }
                           }
        }

        
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
