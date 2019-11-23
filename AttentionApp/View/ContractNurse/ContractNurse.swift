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
    
    var nurseModel: NurseModel
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var address: String = ""
    @State private var payment: String = ""
    @State private var idcustomer: Int = 0
    @State private var idnurse: Int = 0
    @State private var idcard: Int = 0
    
//    @State private var textData: String = ""
//
//    @State var showDatePicker = false
    
    @State var cardList: [CardModel] = []
    
    @State var userModel: UserModel
    
    func stateReset() {
        address = ""
        payment = ""
        idcustomer = 0
        idnurse = 0
        idcard = 0
        
//        textData = ""
    }
    
    var body: some View {
            VStack() {
                Spacer().frame(height: 20)
                        HStack {
                          Text("Seleccionar datos")
                            .bold()
                            .font(.largeTitle)
                        }
                        Spacer().frame(height: 100)
                        HStack{
                                DatePicker(selection: $startDate, in: Date()..., displayedComponents: .date) {
                                        Text(" Fecha de inicio")
                                }
                        
                        }
                        .frame(height: 100)
                        Spacer().frame(height: 120)
                        HStack{
//                            TextField("Nombres", text: $textData, onEditingChanged: {
//                                editting in self.showDatePicker = true
//                            })
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        }.frame(height: 50)
//                        if self.showDatePicker {
                            DatePicker(selection: $endDate, in: Date()..., displayedComponents: .date){
                                Text(" Fecha de fin")
                            }
                        }.frame(height: 100)
//                else{
//                            DatePicker(selection: $endDate, in: Date()..., displayedComponents: .date){
//                                Text("Fecha de fin")
//                            }.hidden()
//                        }
                        HStack{
                            Picker(selection: $idcard, label: Text(" Tarjeta")){
                                List(self.cardList){ res in
                                    Text(res.account_number)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            
                        }
                        Spacer()
                        Button(action: {
                            self.idnurse = self.nurseModel.idnurse
                            self.idcustomer = self.userModel.idcustomer
                            
                            let sDate:Date? = self.startDate
                            let eDate:Date? = self.endDate
                            let common = Date()
                            
                            let dateFormatterString = DateFormatter()
                            dateFormatterString.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                            
                            let dateStartString = dateFormatterString.string(from: sDate ?? common)
                            let dateEndString = dateFormatterString.string(from: eDate ?? common)

                            let parameters: Parameters = [
                                "idcustomer" : 14,
                                "idnurse": self.idnurse,
                                "idcard" : 1,
                                "start_date": dateStartString,
                                "end_date": dateEndString
                            ]
                            ReservationAPI.register(parameters){res in
                                switch res{
                                case .success:
                                    print("success")
                                case let .failure(error):
                                    print(error)
                                }
                            }
                            }){
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
        .onAppear(){
            CardAPI.call(idCard: self.userModel.idcustomer){ res in
                switch res {
                case .success:
                    if let json = res.value{
                        if let datos = json["rows"].array{
                            self.cardList = [CardModel]()
                            for item in datos{
                                var cardModel = CardModel()

                                if var cuenta = item["account_number"].string{
                                    cardModel.account_number = cuenta
                                }
                                if var idCard = item["idcard"].int{
                                    cardModel.idCard = idCard
                                }
                                self.cardList.append(cardModel)
                            }
                        }
                    }
                    case let .failure(error):
                        print(error)
                }
            }
            
        }
    }
}

struct ContractNurse_Previews: PreviewProvider {
    static var previews: some View {
        ContractNurse(nurseModel: NurseModel(), userModel: UserModel())
    }
}
