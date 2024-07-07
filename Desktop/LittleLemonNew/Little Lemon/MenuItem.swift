//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Christine N. on 07/07/2024.
//

import SwiftUI

struct MenuItem: Decodable, Identifiable{
    var id = UUID()
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String
}
//    View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

//#Preview {
//    MenuItem()
//}
