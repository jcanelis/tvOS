//
//  ListView.swift
//  Television
//
//  Created by John Canelis on 4/20/21.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        TabView {
            
            VStack {
                Image("giants")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 600)
                Text("First View")
                    .font(.title)
            }
            .tabItem({ Text("First") })
            .tag(0)
            
            VStack {
                Image("giants")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 600)
                Text("Second View")
                    .font(.title)
            }
            .tabItem({ Text("Second") })
            .tag(1)
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
