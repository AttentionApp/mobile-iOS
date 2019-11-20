//
//  NurseListView.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/11/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI
import Combine

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
    
    
    var body: some View {
        
        NavigationView {
                List(self.nurseList){ nurse in
                    
                    NavigationLink(destination: NurseProfileView(nurseModel:nurse)){
                            Image("ic_nurse_black_24dp")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(nurse.short_name)
                    }
                    
//                    ImageViewWidget(imageUrl: "http://www.trabajadores.cu/wp-content/uploads/2018/05/Anabel-Vald%C3%A9s-750x498.jpg")
                    

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
                                    if var imageURL = item["thumbnail_image"].string{
                                        nurseModel.thumbnail_image  = imageURL
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

class ImageLoader: ObservableObject{
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data(){
        didSet{
            didChange.send(data)
        }
    }
    
    init(imageUrl: String){
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data else {return }
            DispatchQueue.main.async{
                self.data = data
            }
            
        }.resume()
    }
}

struct ImageViewWidget: View{
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String){
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View{
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(named: "ic_nurse_black_24dp")! : UIImage(data: imageLoader.data)!)
        .resizable()
        .frame(width: 50, height: 50)
        
    }
}


struct NurseListView_Previews: PreviewProvider {
    static var previews: some View {
        NurseListView()
    }
}

