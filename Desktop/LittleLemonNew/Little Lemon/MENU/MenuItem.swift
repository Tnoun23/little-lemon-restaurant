////
////  MenuItem.swift
////  Little Lemon
////
////  Created by Christine N. on 07/07/2024.
////
//
//import SwiftUI
//
//// (1. FETCHING & SORTING THE FOOD MENU)
////Step 1, creating menu models
///* 1.1 Create two struct models in two separate swift files. Call one of them "MenuList" and another "MenuItem". Make both of the structs conform to the Decodable protocol.*/
//struct MenuItem: Decodable, Identifiable{
//    var id = UUID()
//    let title: String
//    let image: String
//    let price: String
//    let description: String
//    let category: String
//}
//
///* (1. FETCHING & SORTING THE FOOD MENU)
// Above is the Swift Model. Like the following:
// struct Discount: Decodable {
//      let promotion: String
//      let amount: Double
// }
// 
// Below is the...
// Decode protocol
// let decoder = JSONDecoder()
// 
// let discountObject = try?
// decoder.decode(Discount.self, from: discountData)
// */
