//
//  ReservationsView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/16/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

struct ReservationsView: View {
    
    @EnvironmentObject private var globalState: GlobalState
     @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>
    
    @State var reservationList: [ReservationModel] = []
    
    var body: some View {
        
        NavigationView{
         
            List(self.reservationList){ reservation in 
                Image("ic_nurse_black_24dp")
                Text(reservation.start_date)
            }
            .navigationBarTitle(Text("Mis reservas"))
        }.onAppear(){
            ReservationAPI.call(){ res in
                
                switch res{
                case .success:
                    if let json = res.value{
                        if let datos = json["rows"].array{
                            self.reservationList = [ReservationModel]()
                            for item in datos{
                                var reservationModel = ReservationModel()
                                if var startDate = item["start_date"].string{
                                    
                                    let isoDate = startDate
//                                    print(isoDate)
                                    let common = Date()
                                    let dateFormatter = DateFormatter()
                                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                                    let dateFormatterPrint = DateFormatter()
                                    dateFormatterPrint.dateFormat = "dd' - 'MMM' - 'yyyy"
                                    let date: Date? = dateFormatter.date(from:isoDate)
                                    let dateString = dateFormatterPrint.string(from: date ?? common)
                                    reservationModel.start_date = dateString
                                }
                                if var idNurse = item["idnurse"].int{
                                    reservationModel.idNurse = idNurse
                                }
                                self.reservationList.append(reservationModel)
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

struct ReservationsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationsView()
    }
}
