//
//  HomeView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/10/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            TabView{
                NurseListView().tabItem(){
                    Image("ic_nurse_black_24dp")
                    Text("Enfermeras")
                }
                Text("Mis reservas")
                .tabItem(){
                    Text("Mis reservas")
                }
                UserProfileView().tabItem(){
                    Text("Mi cuenta")
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
