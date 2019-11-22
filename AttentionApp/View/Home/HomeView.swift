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
            TabView{
                NurseListView().tabItem(){
                    Image("ic_nurse_black_24dp")
                    Text("Enfermeras")
                }
                ReservationsView().tabItem(){
                    Image(systemName: "square.and.pencil")
                    Text("Mis reservas")
                }
                UserProfileView().tabItem(){
                    Image(systemName: "person.fill")
                    Text("Mi cuenta")
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
