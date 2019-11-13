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
    
    var body: some View {
        VStack() {
            HStack {
              Text("Crear cuenta")
              .bold()
              .font(.largeTitle)
            }
            Spacer()
            Button(action: {})
            {
                HStack {
                    
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
        
    }
}

struct ContractNurse_Previews: PreviewProvider {
    static var previews: some View {
        ContractNurse()
    }
}
