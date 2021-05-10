//
//  ContentView.swift
//  Television
//
//  Created by John Canelis on 4/18/21.
//

import SwiftUI

struct ContentView: View {
    
    func greet(person: String) -> String {
        let greeting = "Hello, " + person + "!"
        return greeting
    }
    
    func sayHelloWorld() -> Void {
        print("hello, world")
    }
    
    @State var isShowing:Bool = true
    @State private var showActionSheet = false
    @StateObject var products = GetProducts()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    Image(systemName: "clock.fill")
                    Spacer()
                    Toggle("Toggle something", isOn: $isShowing)
                    

                    Spacer()
                    Button("Get started") {
                        print("Press chicken button")
                    }
                }
                
                Spacer()
                
                HStack {
                    Button("Show action sheet") {
                        showActionSheet = true
                    }
                    Spacer()
                    Button("Wow fun!") {
                        print("Wow fun!")
                    }
                }
                .padding(.all, 24.0)
                
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text("Action Sheet title here"),
                                message: Text("Message for the sheet here"),
                                buttons: [
                                    .cancel(),
                                    .destructive(
                                        Text("Perform a delete action here"),
                                        action: sayHelloWorld
                                    ),
                                    .default(
                                        Text("Perform an option here"),
                                        action: sayHelloWorld
                                    )
                                ]
                    )
                }
                
                VStack {
                    List(products.products) { product in
                        NavigationLink(destination: DetailView(item: product)) {
                            Image(systemName: "play.rectangle")
                            Text("\(product.title!)")
                        }
                        .padding(.all, 8.0)
                    }
                }
                .onAppear {
                    products.getProducts()
                }
                
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<5) { row in
                                NavigationLink(destination: ListView()) {
                                    Image("giants")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 400, height: 600)
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Home"))
                .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
