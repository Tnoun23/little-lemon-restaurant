//
//  Delivery.swift
//  Little Lemon
//
//  Created by Christine N. on 01/07/2024.
//

import SwiftUI
import CoreData

struct Menu1: View {
    
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    //    func buildSortDescriptors() -> [NSSortDescriptor]{
    //        [
    //            NSSortDescriptor(
    //            key: "title", ascending: true,
    //            selector: #selector(NSString.localizedCaseInsensitiveCompare)
    //            ),
    //            NSSortDescriptor(
    //            key: "image", ascending: true,
    //            selector: #selector(NSString.localizedCaseInsensitiveCompare)
    //            )
    //        ]
    //    }
    //
    
    func getMenuData() async throws -> MenuItem1 {
        let endpoint = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        guard let url = URL(string: endpoint) else {
            throw urlError.invalidURL
        }
       let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw urlError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(MenuItem1.self, from: data)
        }
        catch {
            throw urlError.invalidData
        }
        
    }

    //
    //        urlSessionTask.resume()
    //
    //
    //        @State var menuItems1 = [MenuItem1]()
    //

    //        menuItems.forEach{ menuItem in
    //            let dish = Dish(context: viewContext)
    //            dish.title = menuItem.title
    //            dish.desc = menuItem.description
    //            dish.image = menuItem.image
    //            dish.category = menuItem.category
    //            dish.id = menuItem.id
    //
    //        }
    //        try? viewContext.save()
    //
    //    }
    
    
    /*
     static func getMenuData(menuItems:[MenuItem]) -> [MenuItem]?{
     PersistenceController.shared.clear()
     
     */
    @State var showModal = false
    @State var searchField: String = ""
    
    var category = ["Starters", "Mains", "Desserts", "Sides"]
    
    @State private var menuItems1: MenuItem1?

    
    var body: some View {

            VStack(spacing: 0){
                //            ZStack{
                //                Rectangle() //.scaledToFit()
                //                    .foregroundColor(.gray)
                //                    .frame(height: 40)
                //                Text("Nav Bar")
                //            }
                ZStack{
                    Color.red
                    
                    HStack(alignment:.bottom){
                        
                        VStack{
                            HStack(alignment: .top){
                                Text("Little Lemon").font(.largeTitle)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
                            }
                            Text("Chicago").font(.title2)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            Spacer(minLength: 5)
                            
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            
                            
                            
                            
                        }.padding()
                        
                     //   Spacer()
                        Rectangle()
                            .frame(width: 160, height: 190)
                            .cornerRadius(15)
                        
                    }.padding()
                }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)

                ZStack(){
                    Color.red
                    VStack{
                        TextField("\(Image(systemName: "magnifyingglass")) Search", text: $searchField)
                            .padding(10)
                            .foregroundColor(.black)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            .background(Color(.white))
                        //      .clipShape(Capsule())
                            .frame(width: 350)
                        
                            .padding()
                        
                    }
                }.fixedSize(horizontal: false, vertical: true)
                
                    HStack{
                        Text("ORDER FOR DELIVERY!")
                            .frame(alignment: .leading)
                            .fontWeight(.bold)
                        
                        Image("Delivery van")
                            .resizable()
                            .frame(width: 50, height: 25, alignment: .leading)
                        Spacer()
                        
                    }.padding()
                    ScrollView (.horizontal) {
                        HStack {
                            
                            //                        ForEach(categories) { category in
                            //                            Text("category")
                            //                                .fixedSize()
                            //                                .cornerRadius(10)
                            //                                .padding()
                            //                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            //                                .onTapGesture {
                            //                             //       print(category)
                            //                                }

                            Button("category"){
                                //      print(category)
                            }.fixedSize()
                                .padding(10)
                                .font(.headline)
                                .background(Color(.white))
                                .cornerRadius(100)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        
                        Button("category"){
                            //      print(category)
                        }.fixedSize()
                            .padding(10)
                            .font(.headline)
                            .background(Color(.white))
                            .cornerRadius(100)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            //                   .clipShape(Capsule())
                                          }
//                        }
                    }.padding(.horizontal)
                
                //               }
                NavigationStack{
                    List{
                        HStack{
             //           ForEach(menuItems1){menu in
                        AsyncImage(url: URL(string: menuItems1?.image ?? "")){ image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Rectangle())
                                .frame(width: 90, height: 90)
                                .cornerRadius(15)
                            
                        } placeholder: {
                            Rectangle()
                                .frame(width: 90, height: 90)
                                .cornerRadius(15)
                        }
                            Button(menuItems1?.title ?? "title placeholder"){
                                print("Button tapped")
                            }
                        }
                        Button("Food Item") {
                            print("Food Item tapped")
                        }
                        
                        Button("Food Item") {
                            print("Food Item tapped")
                        }
                    }
                }
                //                FetchedObjects { (dishes: [Dish]) in
                //
                //   //             }
                ////FetchedObjects<NSManagedObject>: FetchedObjects() { (dishes: [Dish]) in
                //
                //                List{
                //                    ForEach(dishes){ dish in
                //                        HStack{
                //                            Text(dish.title)
                //                            //("Title: \(dish.title), price: \(price), \(category)")
                //                            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")){ image in
                //                               // image
                //                                    //.resizable()
                //                            }
                //                            .frame(width: 50, height: 50)
                //                    }
                //                }
                //            }
                //
                //            }
                
            }
            .task {
                do {
                    menuItems1 = try await getMenuData()
                } catch urlError.invalidURL{
                    print("invalid URL")
                }catch urlError.invalidResponse{
                    print("invalid Response")
                } catch urlError.invalidData{
                    print("invalid Data")
                } catch {
                    print("unexpected error")
                }
            }
        //            .onAppear(){
        //            getMenuData()
        //                    }
    }
}

enum urlError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

#Preview {
    Menu1()
}
