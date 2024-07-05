//
//  Delivery.swift
//  Little Lemon
//
//  Created by Christine N. on 01/07/2024.
//

import SwiftUI

struct Menu: View {
    
    @State var showModal = false
    @State var searchField: String = ""

    
    
    var body: some View {
//        NavigationStack(){
            VStack(spacing: 0){
                ZStack{
                    Rectangle() //.scaledToFit()
                        .foregroundColor(.gray)
                        .frame(height: 50)
                    Text("Nav Bar")
                }
                
                ZStack{
      //            Color(red: 73, green: 94, blue: 87)
              //      Color.primaryColor
//                        Rectangle() //.scaledToFit()
//                        .foregroundColor(.brown)
//                            .frame(height: 350)
                    HStack{
                        VStack{
                            Text("Little Lemon").font(.largeTitle)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        //                        .padding()
                            Text("Chicago").font(.title2)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            Spacer()
                        }.padding()

                        Rectangle()
                            .frame(width: 160, height: 170)
                            .padding(5)
                   //         .scaledToFit()

                    }
                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)

                    VStack{
                        Spacer(minLength: 20)
                        ZStack{
                            TextField("Search", text: $searchField)
                                .padding()
                                .background(Color(.white))
                                .cornerRadius(15)
                                
                        }.padding()
                    }
                }
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.purple)
                        .frame(height: 75)
                    VStack{
                        Text("Order for Delivery")
                        
                        HStack{
                            Spacer()
                            Button("Button 1") {
                                print("1 tapped")
                            }
                            Spacer()
                            Button("Button 2") {
                                print("2 tapped")
                            }
                            Spacer()
                            Button("Button 3") {
                                print("3 tapped")
                            }
                            Spacer()
                            Button("Button 4") {
                                print("4 tapped")
                            }
                            Spacer()
                        }
                    }
                }
                
                    List{
  
//                    Rectangle()
//                            .frame(height: 500)
//                            .foregroundColor(.green)
                        Button("Food Item") {
                            print("Food Item tapped")
                        }
                                //.navigationDestination(isPresented: $showModal) {
//                            SelectedModal()
//                    }
                    }
//                }

            }
//        }
    }
}

#Preview {
    Menu()
}
