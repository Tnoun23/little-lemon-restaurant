////
////  Delivery.swift
////  Little Lemon
////
////  Created by Christine N. on 01/07/2024.
////
//
//import SwiftUI
//import CoreData
//
//struct Menu: View {
//    
//    /* (1. FETCHING & SORTING THE FOOD MENU)
//     4.3 Go back to the Menu view file, and inside the struct, declare the following variable: @Environment(\.managedObjectContext) private var viewContext
//     The Home screen will initialize the Core Data and pass its view context to the Menu instance on initialization.
//     
//     */
//    @Environment(\.managedObjectContext) private var viewContext
//    
//    
//    /* (1. FETCHING & SORTING THE FOOD MENU)
//     Step 5: Create a database model file
//
//     -- Create a new file, and select the Data Model file, under the Core Data section in the iOS tab.
//
//     -- Name the file ExampleDatabase (view under Core Data Support), as this is the name of the database that is set in the Persistence Swift file you added.
//     
//     
//     Step 6: Add a Dish entity
//
//     Open the newly created core data model file and press an "Add Entity" button at the bottom which will add a new entity to the model.
//
//     Change the entity name to Dish and add three properties to it: title, image and price, all of type String.
//
//     (Optional) Remember that if you added more than 3 properties to the menu item model, the dish model would have to have them as well of the same type to be able to convert all data later on.
//     
//     Step 4 - 6: Tip: If you have difficulty completing any of the steps above please review the following materials of the course "Working with data in iOS":
//     https://www.coursera.org/learn/working-with-data-in-ios/lecture/GzJXq/what-is-core-data
//     
//     https://www.coursera.org/learn/working-with-data-in-ios/supplement/W7oHr/core-data-in-depth
//     */
//    
//    
////    @FetchRequest(
////
////        fetchRequest: [NSSortDescriptor(keyPath: \Dish.title,
////                              ascending: true
////                 //             selector: #selector(NSString.localizedCaseInsensitiveCompare)
////                                       )],
////            animation: .default)
////           private var dishes: FetchedResults<Dish>
// 
// /* (2. SORTING & FILTERING FOOD MENU)
//  Step 1: Sorting by name
//
//  -- Open the Menu view file and create a function that returns an array or sort descriptors for Dish objects.
//
//  -- Inside the Menu view, create a new function called buildSortDescriptors and make it return an array of NSSortDescriptor instances.
//  
//  -- Inside the function, declare a return statement followed by the array literal.
//  
//  -- Inside the array literal, initialize an NSSortDescriptor. Use "title" for the key argument, true for the ascending argument and #selector(NSString.localizedStandardCompare) for the selector argument.
//  
//  The function now returns an array with one sort descriptor that will sort the Dish data by title in ascending order.
//
//  Tip: If you have difficulty completing any of the steps above please review the following materials of the course "Working with data in iOS":
//  https://www.coursera.org/learn/working-with-data-in-ios/lecture/GnR3a/sorting-in-core-data
//  
//  https://www.coursera.org/learn/working-with-data-in-ios/supplement/LAF23/nssortdescriptor-in-depth
//  
//  */
//    
///* (2. SORTING & FILTERING FOOD MENU)
// 
// Step 2: Using the function to modify the FetchedObjects result
// Inside the FetchedObjects constructor call which is currently empty, set the sortDescriptors argument and pass it the result of the buildSortDescriptors function call.
//
// You can run your project again, register, and you should see that the menu list order has changed. This is because the sort descriptors sort the list of Dishes before displaying it on the screen.
//
// Tip: If you have difficulty completing any of the steps above please review the following materials of the course "Working with data in iOS":
// https://www.coursera.org/learn/working-with-data-in-ios/lecture/waSwH/connecting-core-data-to-ui-state
//     */
//    
//    /* (2. SORTING & FILTERING FOOD MENU)
//     Step 3: Adding a search field to filter the data
//
//     Follow the steps below to add a search field that you can later use to filter the menu list to search for a particular dish by title:
//
//     Inside the Menu struct, add a local variable called searchText and initialize it with an empty String.
//
//     Mark it with the @State statement before its declaration to make it a state variable as well.
//     Add a new TextField immediately above the FetchedObjets element and initialize it. Set the first parameter as "Search menu" and set the searchText variable to the second text argument. Remember to use the $ sign when referencing the state variable in this place.
//     ---
//     
//     Step 4: Add a function that returns a predicate to filter the FetchedObjets results
//     
//     Inside the Menu struct, create a new function called buildPredicate and make it return the NSPredicate.
//
//     Inside the function, check if the searchText state variable is empty.
//
//     If it is empty, return a new instance of the NSPredicate passing true to the value argument.
//     If it is not empty, return a new instance of the NSPredicate by passing the following into its format argument: "title CONTAINS[cd] %@", searchText. It will try to match part of the title property of the Dish to the given text and return all objects that match.
//     Tip: If you have difficulty completing any of the steps above please review the following materials of the course "Working with data in iOS":
//     https://www.coursera.org/learn/working-with-data-in-ios/lecture/E7OJu/filtering-in-core-data
//     
//     https://www.coursera.org/learn/working-with-data-in-ios/supplement/IpMjR/nspredicate-in-depth
//     
//     
//     Step 5: Update the FetchedObjets element with the added function
//
//     Inside the FetchedObjects constructor call, add a predicate argument before the sortDescriptors, and pass the result of the buildPredicate function call to it.
//
//     Step 6: Run the project
//
//     Run the application and register. In the menu tab, you should observe a new text field right above the menu list. Try writing a part of the name of any dish, and you should see the list shrink to the items that match the part of their title with the search text.
//     
//     */
//    
//    func buildSortDescriptors() -> [NSSortDescriptor]{
//        [
//            NSSortDescriptor(
//            key: "title", ascending: true,
//            selector: #selector(NSString.localizedCaseInsensitiveCompare)
//            ),
//            NSSortDescriptor(
//            key: "image", ascending: true,
//            selector: #selector(NSString.localizedCaseInsensitiveCompare)
//            )
//        ]
//    }
//    
//    
//// (1. FETCHING & SORTING THE FOOD MENU)
////Step 2. Querying the server
//// 2.1 Inside the Menu struct, create a new method called getMenuData.
////    func getMenuData(_ coreDataContext:NSManagedObjectContext) async {
//    func getMenuData(){
//        PersistenceController.shared.clear()
//
//// 2.2 Start by defining a constant that will hold the server url String.
//        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
///* 2.3 Secondly, initialize the new constant that holds the URL object created from the String server address and because you know the server address is correct - you can force unwrap the URL using ! after the constructor call as it will never crash. */
//        let urlObjectHolder = url
//        
// /* 2.4 Next, define another constant that will hold the URLRequest instance created using the url constant created in the previous step.*/
//        let request = URLRequest(url: urlObjectHolder)
//        
///* 2.5 Afterward, use the shared property of the URLSession class and call the method dataTask on it. Use the request object as an argument and a trailing closure to handle the response. Capture the result of the task in a new variable.
// */
//        
//        let urlSessionTask = URLSession.shared.dataTask(with: request) { url, response, error in
//            var response = urlSessionTask
//            print(response)
//            
//            
//            /* (1. FETCHING & SORTING THE FOOD MENU)
//             Step 3: Parsing response into models using JSONDecoder
//
//             Use JSONDecoder to parse the response data inside the completion closure of the data task:
//             -- Inside the data task completion closure, add an if-let statement to safely unwrap data that you get as the first argument of the closure.
//             -- Inside the if block, start by declaring a new constant and initialize it with a new JSONDecoder instance.
//             -- Next, call the decode method on the decoder instance. Pass the MenuList.self as the first argument, and the unwrapped data object as the second. Remember to put the call in a try? expression and capture the result in a new constant.
//             
//             Tip: If you have difficulty completing any of the steps above, please review the following of the course "Working with data in iOS":
//             https://www.coursera.org/learn/working-with-data-in-ios/lecture/4SUJJ/introduction-to-json
//             
//             https://www.coursera.org/learn/working-with-data-in-ios/supplement/pOmwQ/json-in-depth
//             */
//            if let decoder = JSONDecoder(){
//                let menuItemObj = try?
//                decoder.decode(MenuItem(from: response))
//            }
//        }
//        
//// (1. FETCHING & SORTING THE FOOD MENU)
////2.6 Use the task variable to call the resume method on it to start the task.
//        urlSessionTask.resume()
//        
//        
//        @State var menuItems = [MenuItem]()
//             
////        do{
////            let (data, _) = try await urlSession.data(from: url)
////            let fullMenu = try JSONDecoder().decode(MenuList.self, from: data)
////            let menuItems = fullMenu.menu
////        }
////        catch {}
////        
////        menuItems.forEach{ menuItem in
////            let dish = Dish(context: viewContext)
////            dish.title = menuItem.title
////            dish.desc = menuItem.description
////            dish.image = menuItem.image
////            dish.category = menuItem.category
////            dish.id = menuItem.id
////            
////        }
////        try? viewContext.save()
//        
//    }
//  /*(1. FETCHING & SORTING THE FOOD MENU)
//   Step 7: Save mapped menu items into the database
//
//   Go back to the Menu view file, and update the getMenuData method to convert the list of MenuItem objects into the list of Dish objects and save them to the database.
//
//   --Inside the getMenuData function find the constant that holds the result of decoded menu items.
//   
//   -- Access the menu property of the result, and use a for loop, for example, to iterate over each menu item inside the menu property.
//   -- Inside the loop block, for each item, initialize a new Dish instance and store it into a constant.
//   
//   -- Use that constant to set the title, image and price from the menu item same properties.
//   
//   -- After the loop ends, add the following call to save the data into the database: try? viewContext.save().
//   
//   -- To clear the database each time before saving the menu list again, on the first line of the getMenuData method, before any other code is executed, use the shared property of the PersistenceController and call the clear method on it. It will make sure that the database is cleared of all the Dish data before fetching and storing the new ones again.
//   
//   Tip: If you have difficulty completing any of the steps above please review the following materials of the course "Working with data in iOS":
//   https://www.coursera.org/learn/working-with-data-in-ios/supplement/7wavL/entities-and-relationships-in-depth
//   
//   https://www.coursera.org/learn/working-with-data-in-ios/supplement/pfmEl/using-classes-with-core-data-in-depth
//   
//   */
//    
//    /*(1. FETCHING & SORTING THE FOOD MENU)
//     Step 8: Displaying the list of menu items from the database
//
//     Update the List element of the Menu view to display the Dish items that were saved to the database.
//
//     Remove the List element from the Menu view for now, and in its place, add the following call to it: FetchedObjects: FetchedObjects() { (dishes: [Dish]) in }. This will fetch all the Dishes from the core data and make them available to use in the closure.
//
//     Inside the closure add a List element.
//     Inside the list element, use the ForEach element and pass the dishes argument of the closure to its constructor.
//     Add a trailing closure right after the ForEach element initialization and make closure get a single dish argument.
//     Inside the ForEach trailing closure body, add a new HStack element.
//     Inside the stack element, add a  Text element and initialize it with a String that would be a combination of the title and the price of the dish argument of the closure to display them.
//     Also, inside the stack, after the text element add an AsyncImage element and initialise it by using the constructor that takes a url argument. Create a new URL object using the image property of the dish variable, and set it to the constructor.
//     Images might be too big, so you will have to style them to resize them. You can read about the AsyncImage styling
//     here: https://developer.apple.com/documentation/swiftui/asyncimage
//     
//     Tip: If you have difficulty completing any of the steps above please review the following materials of the course "Working with data in iOS":
//     
//     https://www.coursera.org/learn/working-with-data-in-ios/lecture/waSwH/connecting-core-data-to-ui-state
//     
//     https://www.coursera.org/learn/working-with-data-in-ios/supplement/INNVb/core-data-and-state-in-depth
//     */
//    /*(1. FETCHING & SORTING THE FOOD MENU)
//     Step 9: Run the code
//
//     Run the application. Register, and when you see the home screen with the menu tab, the on-appear function should fetch the menu data, decode it with JSONDecoder, save it to the database by converting the menu items to the Dish objects and finally store them in the database. Immediately after that, the FetchedObjects element will notice that and fetch all the Dish objects from the database and display them in the list as text and image.
//
//     You should see a list of menu item information that you have entered inside the text and image elements in the last part of step 7.
//
//     (Optional) Step 10: Dish details screen
//
//     You could wrap the HStack added in step 8 inside the NavigationLink and create a new SwiftUI file to represent the details of the menu item. The new details screen would need a local constant of a dish. Then you would initialize a new instance of the details screen with a dish argument of the closure, and pass it to the destination parameter in the navigation link constructor. Then it's up to you what information and how would you display it inside the dish details screen. When using the application, when the user presses on any dish row, they will be taken to the details screen.
//     */
//    
//    
//    
//    
//    /*
//    static func getMenuData(menuItems:[MenuItem]) -> [MenuItem]?{
//        PersistenceController.shared.clear()
//        
//        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
//        let request = URLRequest(url: url)
//        
//        let dataTask = URLSession.shared.dataTask(with: request) { url, response, error in
//            print(url!)
//            
//            if let url{
//                let menuitems = try? JSONDecoder().decode(MenuList.self, from: url)
//            }
//        }
//        dataTask.resume()
//    }
//     */
//        @State var showModal = false
//        @State var searchField: String = ""
//
//        var categories = ["Starters", "Mains", "Desserts", "Sides"]
//        
//    var body: some View {
//
//        VStack(spacing: 0){
//            //            ZStack{
//            //                Rectangle() //.scaledToFit()
//            //                    .foregroundColor(.gray)
//            //                    .frame(height: 40)
//            //                Text("Nav Bar")
//            //            }
//            ZStack{
//                Color.red
//                
//                HStack(alignment:.bottom){
//                    
//                    VStack{
//                        HStack(alignment: .top){
//                            Text("Little Lemon").font(.largeTitle)
//                                .frame(maxWidth: .infinity, alignment: .topLeading)
//                                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
//                        }
//                        Text("Chicago").font(.title2)
//                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//                        Spacer(minLength: 5)
//                        
//                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
//                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
//                        
//                        
//                        
//                        
//                    }.padding()
//                    
//                 //   Spacer()
//                    Rectangle()
//                        .frame(width: 160, height: 190)
//                        .cornerRadius(15)
//                    
//                }.padding()
//            }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
//
//            ZStack(){
//                Color.red
//                VStack{
//                    TextField("\(Image(systemName: "magnifyingglass")) Search", text: $searchField)
//                        .padding(10)
//                        .foregroundColor(.black)
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
//                        .background(Color(.white))
//                    //      .clipShape(Capsule())
//                        .frame(width: 350)
//                    
//                        .padding()
//                    
//                }
//            }.fixedSize(horizontal: false, vertical: true)
//            
//                HStack{
//                    Text("ORDER FOR DELIVERY!")
//                        .frame(alignment: .leading)
//                        .fontWeight(.bold)
//                    
//                    Image("Delivery van")
//                        .resizable()
//                        .frame(width: 50, height: 25, alignment: .leading)
//                    Spacer()
//                    
//                }.padding()
//                ScrollView (.horizontal) {
////                        HStack {
//                        
//                        //                        ForEach(categories) { category in
//                        //                            Text("category")
//                        //                                .fixedSize()
//                        //                                .cornerRadius(10)
//                        //                                .padding()
//                        //                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
//                        //                                .onTapGesture {
//                        //                             //       print(category)
//                        //                                }
//
//                        Button("category"){
//                            //      print(category)
//                        }.fixedSize()
//                            .padding(10)
//                            .font(.headline)
//                            .background(Color(.white))
//                            .cornerRadius(100)
//                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
//                        //                   .clipShape(Capsule())
//                        //              }
////                        }
//                }.padding(.horizontal)
//            
//            //               }
//            NavigationStack{
//                List{
//                    
//                    Button("Food Item") {
//                        print("Food Item tapped")
//                    }
//                    
//                }
//            }
//            //                FetchedObjects { (dishes: [Dish]) in
//            //
//            //   //             }
//            ////FetchedObjects<NSManagedObject>: FetchedObjects() { (dishes: [Dish]) in
//            //
//            //                List{
//            //                    ForEach(dishes){ dish in
//            //                        HStack{
//            //                            Text(dish.title)
//            //                            //("Title: \(dish.title), price: \(price), \(category)")
//            //                            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")){ image in
//            //                               // image
//            //                                    //.resizable()
//            //                            }
//            //                            .frame(width: 50, height: 50)
//            //                    }
//            //                }
//            //            }
//            //
//            //            }
//            
//        } /* (1. FETCHING & SORTING THE FOOD MENU)
//           2.7 At the end of the VStack element call onAppear method and inside the trailing closure, call the newly created getMenuData method to get the data each time user goes into the menu screen.
//           
//           Tip: If you have difficulty completing any of the steps above please review the following materials of the course "Working with data in iOS":
//           https://www.coursera.org/learn/working-with-data-in-ios/lecture/UDQAY/contacting-servers-http-protocol-and-asynchronous-calls
//           
//           https://www.coursera.org/learn/working-with-data-in-ios/lecture/iYF9W/http-protocol-and-asynchronous-calls-in-action
//           
//           https://www.coursera.org/learn/working-with-data-in-ios/supplement/axN5K/http-protocol-and-asynchronous-calls-in-detail
//           */
//            .onAppear(){
//            getMenuData()
//                    }
//    }
//}
//    
//extension String: Identifiable{
//    public var id: String {
//        self
//    }
//}
//
//#Preview {
//    Menu()
//}
