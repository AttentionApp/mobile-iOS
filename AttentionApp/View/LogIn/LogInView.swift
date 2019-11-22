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
    @State private var showingAlert = false
    @State private var AuthenticationError = false
    
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
                
                //                self.showingAlert.toggle()
                //                self.AuthenticationError.toggle()
                //                return
                let parameters: Parameters = [
                    "email": self.email,
                    "password": self.password,
                ]
                if (self.email == "" || self.password == "") {
                    self.showingAlert=true
                    return
                    
                }
                
                AccountAPI.login(parameters) {
                    res in
                    switch res {
                    case .success:
                        if let json = res.value, let accessToken = json["token"].string, let success = json["success"].string {
                            self.globalState.accessToken = accessToken
                            print(accessToken)
                            self.globalState.messageSuccess = success
                            print(success)
                            //self.globalState.accessToken = successMessage
                            
                        }
                        //                  self.stateReset()
                    //                        self.presentation.wrappedValue.dismiss()
                    case .failure(let error):
                        print(error)
                        self.showingAlert = true
                        
                   
                    }
                    
                }
                
            }){
                HStack {
                    
                    Text(stringIniciarSesion)
                        .fontWeight(.semibold)
                        .font(.callout)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Email o contraseña inválidos"), dismissButton: .default(Text("Ok")))
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
                
                .sheet(isPresented: $showModal, content: {
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
