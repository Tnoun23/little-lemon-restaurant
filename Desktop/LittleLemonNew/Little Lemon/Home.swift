//
//  Home.swift
//  Little Lemon
//
//  Created by Christine N. on 03/07/2024.
//

import SwiftUI

struct Home: View {
    /* (1. FETCHING & SORTING THE FOOD MENU)
     Step 4: Initialise core data
     4.1
     Follow the list below to initialize Core Data when your application starts:

     Open the Home screen file and inside the struct declare a new persistence constant and initialize it by calling the shared property of the PersistenceController.
     */
    let persistence = PersistenceController.shared
    
    
    var body: some View {
        TabView{
            NavigationStack(){
                Text("Home View")
                    .navigationTitle("Home")
            }
            Menu1()
            /* (1. FETCHING & SORTING THE FOOD MENU)
             4.2 Add the following method call immediately after the Menu instance initialization and before or after the tabItem method call: .environment(\.managedObjectContext, persistence.container.viewContext).*/
                .environment(\.managedObjectContext, persistence.container.viewContext)
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
