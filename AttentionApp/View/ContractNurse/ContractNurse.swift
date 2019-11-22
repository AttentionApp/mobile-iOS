//
//  ContractNurse.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/12/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct ContractNurse: View {
    
    @EnvironmentObject private var globalState: GlobalState
    @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>
    
    let stringContratar : String = "Contratar"
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var address: String = ""
    @State private var payment: String = ""
    @State private var idcustomer: Int = 0
    @State private var idnurse: Int = 0
    @State private var idcard: Int = 0
    
    func stateReset() {
        address = ""
        payment = ""
        idcustomer = 0
    }
    
    var body: some View {
        
        NavigationView{
            VStack() {
                        HStack {
                          Text("Seleccionar datos")
                            .bold()
                            .font(.largeTitle)
                        }
                        HStack{
                                DatePicker(selection: $startDate, in: Date()..., displayedComponents: .date) {
                                        Text("Fecha de inicio")
                                }
                        
                        }
                        .frame(width: 100,height: 100)
                        Spacer()
                        HStack{
                            DatePicker(selection: $endDate, in: Date()..., displayedComponents: .date) {
                                Text("Fecha de fin")
                            }
                        }
                        .frame(width:100,height: 100)
//                        HStack{
//                            
//                            Picker(selection: $idcard, label: Text("Tarjeta")){
//                                
//                            }
//                            
//                        }
                        Spacer()
                        Button(action: {
                            UserAPI.data(){ res in
                                        switch res {
                                            case .success:
                                                if let json = res.value{
                                                    let datos = json["data"]
                                                    self.idcustomer = datos["idcustomer"].int!
                                                }
                                            case let .failure(error):
                                                print(error)
                                        }
                            }
                            let parameters: Parameters = [
                                "idcustomer" : self.idcustomer,
                                "idnurse": self.idnurse,
                                "idcard" : self.idcard,
                                "start_date": self.$startDate,
                                "end_date":self.$endDate,
                            ]
                            
                        })
                        {
                            HStack{
            
                                Text(stringContratar)
                                    .fontWeight(.semibold)
                                    .font(.callout)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.blue)
                            .cornerRadius(40)
                        }.padding(20)
                    }
        }.onAppear(){
            
        }
        
    }
}

struct ContractNurse_Previews: PreviewProvider {
    static var previews: some View {
        ContractNurse()
    }
}
