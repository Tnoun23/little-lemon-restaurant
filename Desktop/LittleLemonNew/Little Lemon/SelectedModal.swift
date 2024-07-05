//
//  SelectedModal.swift
//  Little Lemon
//
//  Created by Christine N. on 01/07/2024.
//

import SwiftUI

struct SelectedModal: View {
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(height: 50)
                HStack{
                    Text("Navigation Bar")
                }
            }
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 300)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            ZStack{
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            Rectangle()
                .frame(height: 75)
        }

    }
}

#Preview {
    SelectedModal()
}
