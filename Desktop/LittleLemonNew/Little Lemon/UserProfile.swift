//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Christine N. on 04/07/2024.
//

import SwiftUI

let firstName = defaults.string(forKey: "firstName")
let lastName = defaults.string(forKey: "lastName")
let email = defaults.string(forKey: "email")


struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal information")
            Image("profile-image-placeholder").resizable()
                .frame(width: 50, height: 50)
            Text("\(firstName)")
            Text("\(lastName)")
            Text("\(email)")

            Button("Log Out"){
                UserDefaults.standard.bool(forKey: "userIsLoggedIn") == false
                self.presentation.wrappedValue.dismiss()
            }
            Spacer(minLength: 0)

        }
    }
}

#Preview {
    UserProfile()
}
