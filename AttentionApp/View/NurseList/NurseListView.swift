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
    
    @State var nurseList: [NurseModel] = []
    @State var imageLoader : ImageLoader?
    
    
    class ImageLoader: ObservableObject{
        
        @Published var dataIsValid = false
        var data:Data?
        
        init(urlString:String){
            guard let url = URL(string: urlString) else { return }
            let task = URLSession.shared.dataTask(with : url){ data, resonse, error in
                guard let data = data else { return }
                DispatchQueue.main.async{
                    self.dataIsValid = true
                    self.data = data
                }
            }
            task.resume()
        }
    }

    func imageFromData(_ data:Data) -> UIImage {
        UIImage(data: data) ?? UIImage()
    }
    
    var body: some View {
              
        NavigationView {
                List(self.nurseList){ nurse in
                    NavigationLink(destination: NurseProfileView(nurseModel: nurse)){
//                        Profe sigue sin funcionar la imagen
                        
                        
//                        imageLoader = ImageLoader(urlString: nurse.thumbnail_image)
//                        Image(uiImage: imageLoader.dataIsValid ? imageFromData(imageLoader.data!) : UIImage())
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width:50, height:50)
                        
                            Image("ic_nurse_black_24dp")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(nurse.short_name)
                    }
                }.navigationBarTitle(Text("Lista de Enfermeras"))

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
                                }
                                self.nurseList.append(nurseModel)
                                
                            }
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

