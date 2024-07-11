//
//  Delivery.swift
//  Little Lemon
//
//  Created by Christine N. on 01/07/2024.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(
//
//        fetchRequest: [NSSortDescriptor(keyPath: \Dish.title,
//                              ascending: true
//                 //             selector: #selector(NSString.localizedCaseInsensitiveCompare)
//                                       )],
//            animation: .default)
           private var dishes: FetchedResults<Dish>
    
    func buildSortDescriptors() -> [NSSortDescriptor]{
        [
            NSSortDescriptor(
            key: "title", ascending: true,
            selector: #selector(NSString.localizedCaseInsensitiveCompare)
            ),
            NSSortDescriptor(
            key: "image", ascending: true,
            selector: #selector(NSString.localizedCaseInsensitiveCompare)
            )
        ]
    }
    
    
    
    func getMenuData(_ coreDataContext:NSManagedObjectContext) async {
        PersistenceController.shared.clear()


        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        @State var menuItems = [MenuItem]()
        
        let request = URLRequest(url: url)
       //let urlSession = URLSession.shared.dataTask(with: request)
        let urlSession = URLSession.shared

        
        do{
            let (data, _) = try await urlSession.data(from: url)
            let fullMenu = try JSONDecoder().decode(MenuList.self, from: data)
            let menuItems = fullMenu.menu
        }
        catch {}
        
        menuItems.forEach{ menuItem in
            let dish = Dish(context: viewContext)
            dish.title = menuItem.title
            dish.desc = menuItem.description
            dish.image = menuItem.image
            dish.category = menuItem.category
            dish.id = menuItem.id
            
        }
        try? viewContext.save()
        
    }
    
    static func getMenuData(menuItems:[MenuItem]) -> [MenuItem]?{
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { url, response, error in
            print(url!)
            
            if let url{
                let menuitems = try? JSONDecoder().decode(MenuList.self, from: url)
            }
        }
        dataTask.resume()
    }
        @State var showModal = false
        @State var searchField: String = ""

        var categories = ["Starters", "Mains", "Desserts", "Sides"]
        
    var body: some View {

            VStack(spacing: 0){
                ZStack{
                    Rectangle() //.scaledToFit()
                        .foregroundColor(.gray)
                        .frame(height: 50)
                    Text("Nav Bar")
                }
                ZStack{
                    Color.green
                    
                    HStack{
                        
                        VStack{
                            Spacer()
                            Text("Little Lemon").font(.largeTitle)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)

                            Text("Chicago").font(.title2)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)

                        }//.padding()
                        Spacer()
                        Rectangle()
                            .frame(width: 160, height: 170)
                 //           .padding(EdgeInsets())

                    }.padding()
                }
                HStack{
                    ZStack{
                        Color.green
                            .ignoresSafeArea()
                        TextField("\(Image(systemName: "magnifyingglass")) Search", text: $searchField)
                            .padding(10)
                            .foregroundColor(.black)
                        //      .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            .background(Color(.white))
                            .clipShape(Capsule())
                            .frame(width: 350)

                    }
                }
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

                        Spacer()

                        ForEach(categories) { category in
//                            Text(category)
//                                .fixedSize()
//                                .cornerRadius(10)
//                                .padding()
//                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
//                                .onTapGesture {
//                                    print(category)
//                                }
                            
                            Button(category){
                                print(category)
                            }.fixedSize()
                                .padding()
                                .font(.headline)
                                .background(Color(.white))
                                .cornerRadius(100)
             //                   .clipShape(Capsule())
                        }
                    }
                }

                
//                    List{
//
//                        Button("Food Item") {
//                            print("Food Item tapped")
//                        }
//
//                    }
                
                FetchedObjects { (dishes: [Dish]) in
                
   //             }
//FetchedObjects<NSManagedObject>: FetchedObjects() { (dishes: [Dish]) in

                List{
                    ForEach(dishes){ dish in
                        HStack{
                            Text(dish.title!)
                            //("Title: \(dish.title), price: \(price), \(category)")
                            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")){ image in
                               // image
                                    //.resizable()
                            }
                            .frame(width: 50, height: 50)
                    }
                }
            }

            }
.onAppear(){
    Menu.getMenuData(menuItems: [MenuItem]())
            }
        }
    }
}
    
extension String: Identifiable{
    public var id: String {
        self
    }
}

#Preview {
    Menu()
}
