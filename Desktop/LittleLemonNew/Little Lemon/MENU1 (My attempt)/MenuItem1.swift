//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Christine N. on 07/07/2024.
//

import SwiftUI

struct MenuItem1: Decodable, Identifiable{
    var id = UUID()
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String
}

struct MenuList1:  Decodable {  //MenuSection
    let menu: [MenuItem1]
}
