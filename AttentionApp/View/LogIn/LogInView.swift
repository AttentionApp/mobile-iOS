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
    
    @State private var showLogin = false
    @State private var showModal = false
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    
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
                .textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.emailAddress).autocapitalization(.none)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(.none)
            Spacer()
                .frame(height: 50)
            Button(action: {

                            let parameters: Parameters = [
                                "email": self.email,
                                "password": self.password,
                            ]
                AccountAPI.login(parameters) { res in
                            switch res {
                            case .success:
                              if let json = res.value, let accessToken = json["token"].string {
                                self.globalState.accessToken = accessToken
                                //print(accessToken)
                              }
            //                  self.stateReset()
                              self.presentation.wrappedValue.dismiss()
                            case let .failure(error):
                              print(error)
                            }
                          }
                self.showLogin = true
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
           .sheet(isPresented: $showLogin, content:{
                   HomeView().environmentObject(self.globalState)
           })

            /*.alert(isPresented: $showingAlert) {
                                Alert(title: Text("Error"), message: Text("Email o contraseña inválidos"), dismissButton: .default(Text("Ok")))
                           }*/
            

            
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
            .sheet(isPresented: $showModal, content:{
                    RegisterView().environmentObject(self.globalState)
            })
           
            
        }
        .padding(48)

        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView().environmentObject(GlobalState())
    }
}
