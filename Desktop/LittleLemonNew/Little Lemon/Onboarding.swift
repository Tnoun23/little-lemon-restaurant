//
//  Restaurant.swift
//  Little Lemon
//
//  Created by Christine N. on 18/06/2024.
//

import SwiftUI

    
//    let firstName1 = "Jane"
//    let lastName1 = "Doe"
//    let email1 = "JnDoe@email.com"

let defaults = UserDefaults.standard

let userIsLoggedIn = "userIsLoggedIn"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack{
            VStack{
//                                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
//                                    EmptyView()
//                                }
                
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email Address", text: $email)
                
                Button("Register") {
                    if firstName.isEmpty == false {
                        defaults.set("Jane", forKey: "firstName");
                    } else if lastName.isEmpty == false {
                        defaults.set("Doe", forKey: "lastName");
                    }
                       else if email.isEmpty == false {

                        defaults.set("JnDoe@email.com", forKey: "email")
                    }
                    else {
                        defaults.set(true, forKey: "userIsLoggedIn")
                        
                    }
                    isLoggedIn = true
                }
                .navigationDestination(isPresented: $isLoggedIn) {
                    Home()
                }
                
            }.padding()
            
                .onAppear(){
                    if UserDefaults.standard.bool(forKey: "userIsLoggedIn") == true {
                        
                    }
                }
        }
    }
}

#Preview {
    Onboarding(firstName: "", lastName: "", email: "")
}
