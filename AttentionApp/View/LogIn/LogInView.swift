//
//  LogInView.swift
//  AttentionApp
//
//  Created by Ricardo Guevara on 11/4/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON


struct LogInView: View {
    @EnvironmentObject private var globalState: GlobalState
    @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>
    
    @State private var showModal = false
    @State private var email: String = ""
    @State private var password: String = ""
    
    let stringIniciarSesion:String = "Iniciar Sesión"
    let stringRegistrarse:String = "Crear una cuenta"
    
    var logInFormData: Parameters {
        [
            "email": email,
            "password": password,
        ]
    }
    
    
    var body: some View {
        VStack {
            Image("ic_logo").resizable().frame(width: 230, height: 200)
            Spacer()
                .frame(height: 50)
            Text("Iniciar Sesión")
                .bold()
                .font(.largeTitle)
            Text("Por favor, ingrese su email y contraseña")
                .font(.subheadline)
            Spacer()
                .frame(height: 50)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
                .frame(height: 50)
            Button(action: {
                print("button tapped!")
            }) {
                HStack {
                    
                    Text(stringIniciarSesion)
                        .fontWeight(.semibold)
                        .font(.callout)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.black)
                .background(Color.blue)
                .cornerRadius(40)
            }.padding(20)
           
            
            Button(action: {
                self.showModal = true
            }) {
                HStack {
                    
                    Text("Crear una cuenta")
                        .fontWeight(.bold)
                        .font(.callout)
                }
       
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.blue)
                .background(Color.white)
                .padding()
               .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.blue, lineWidth: 8)
                 .cornerRadius(40))
                
                
            }.padding()
            
           
            
        }
        .padding(48)
        .sheet(isPresented: $showModal, content: {
          RegisterView().environmentObject(self.globalState)
        })
        
        
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView().environmentObject(GlobalState())
    }
}
