//
//  ListView.swift
//  Television
//
//  Created by John Canelis on 4/20/21.
//

import SwiftUI

struct ListView: View {
    
    var item: Product!
    
    init(item: Product) {
        self.item = item
    }
    
    var body: some View {
        TabView {
            ForEach(item.photos!, id: \.self) { photo in
                URLImage(url: photo.url!)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .animation(.linear)
                    .tabItem({ Text(photo.title!) })
            }
        }
    }
}
