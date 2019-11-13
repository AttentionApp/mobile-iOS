//
//  NurseListView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/11/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

struct NurseRow: View{
    var nurse : NurseModel
    
    var body: some View{
        Text(nurse.first_name)
    }
}

struct NurseListView: View {
    
    @EnvironmentObject private var globalState: GlobalState
    @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>
    
    
    @State var nurseList: [NurseModel] = []
    
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                List(self.nurseList){ nurse in
                    Image("ic_nurse_black_24dp")
                    Text(nurse.short_name)                    
                }
            }
            .navigationBarTitle(Text("Lista de Enfermeras"))
        }.onAppear(){
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
                                    //                                                    print(nurseModel.short_name)
                                    if var imageURL = item["thumbnail_image"].string{
                                        nurseModel.thumbnail_image  = imageURL
                                        //                                                        print(nurseModel.thumbnail_image)
                                    }
                                    if var lastName = item["last_name"].string{
                                        nurseModel.last_name = lastName
                                    }
                                    if var firstName = item["first_name"].string{
                                        nurseModel.first_name = firstName
                                    }
                                }
                                self.nurseList.append(nurseModel)
                                
                            }
                            
                            print(self.nurseList)
                        }
                        //                                        let arrayName = json["rows"].arrayValue.map{
                        //                                             $0["short_name"].stringValue
                        //                                        }
                        //                                        let arrayImageURL = json["rows"].arrayValue.map{
                        //                                              $0["thumbnail_image"].stringValue
                        //                                        }
                        //                                        print(arrayName)
                        //                                        print(arrayImageURL)
                        //                                        print(nurses)
                        //print(nurses)
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
        NurseListView()
    }
}

func example()  {
    
}
