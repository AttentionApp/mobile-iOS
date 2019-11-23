//
//  NurseListView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/11/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

//struct NurseRow: View{
//    var nurse : NurseModel
//
//    var body: some View{
//        Text(nurse.first_name)
//    }
//}

struct NurseListView: View {
    
    @EnvironmentObject private var globalState: GlobalState
    @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>
    
    @State var userModel: UserModel?
    
    @State var nurseList: [NurseModel] = []
    
    let stringTitulo = "LISTA DE ENFERMERAS"
    let stringCloseSession = "Cerrar Sesión"
    
//    var btnBack : some View { Button(action: {
//        self.presentation.wrappedValue.dismiss()
//        }) {
//            HStack {
//                Image(systemName: "arrow.left.to.line") // set image here
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
//                Text(stringCloseSession)
//            }
//        }
//    }
    
    var body: some View {
        VStack{
            Text(stringTitulo).bold().font(.system(size: 30))
//            Spacer().frame(height: 50)
                List(self.nurseList){ nurse in
                    NavigationLink(destination: NurseProfileView(nurseModel: nurse,userModel: (self.userModel)!)){
                        
                        ImageView(withURL: nurse.thumbnail_image)
                        .frame(width: 50, height: 50)
//                            Image("ic_nurse_black_24dp")
//                                .resizable()
//                                .frame(width: 50, height: 50)
                            Text(nurse.short_name)
                    }
                }
        }
        .onAppear(){
            NurseAPI.viewAll(){res in
                switch res {
                case .success:
                    if let json = res.value{
                        if let datos = json["rows"].array{
                            self.nurseList = [NurseModel]()
                            for item in datos {
                                var nurseModel = NurseModel()
                                if var shortName = item["short_name"].string{
                                    nurseModel.short_name  = shortName
                                    if var imageURL = item["thumbnail_image"].string{
                                        nurseModel.thumbnail_image  = imageURL
                                    }
                                    if var lastName = item["last_name"].string{
                                        nurseModel.last_name = lastName
                                    }
                                    if var firstName = item["first_name"].string{
                                        nurseModel.first_name = firstName
                                    }
                                    if var idNurse = item["idnurse"].int{
                                        nurseModel.idnurse = idNurse
                                    }
                                    if var description = item["description"].string{
                                        nurseModel.description = description
                                    }
                                }
                                self.nurseList.append(nurseModel)
                            }
                        }
                        print(self.userModel)
                    }
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}

struct NurseListView_Previews: PreviewProvider {
    static var previews: some View {
        NurseListView(userModel: UserModel())
    }
}

