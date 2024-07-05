//
//  Home.swift
//  Little Lemon
//
//  Created by Christine N. on 03/07/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            NavigationStack(){
                Text("Home View")
                    .navigationTitle("Home")
            }
            Menu()
            .tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
