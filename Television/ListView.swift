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
                AsyncImage(url: photo.url!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .tabItem({ Text(photo.title!) })
            }
        }
    }
}
