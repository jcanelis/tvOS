//
//  DetailView.swift
//  Television
//
//  Created by John Canelis on 5/10/21.
//

import SwiftUI
import Contentful

struct DetailView: View {
    
    var item: Product!
    
    init(item: Product) {
        self.item = item
    }
    
    var body: some View {
        
        HStack {
            
            VStack {
                URLImage(url: item.mainPhoto!.url!)
            }
            
            VStack {
                Text("\(item.price!)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("\(item.id)")
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                    .lineLimit(1)
                    .padding(.all, 4.0)
                
                Text(item.description!)
                    .font(.body)
                    .fontWeight(.regular)
                    .padding(.all, 24.0)
                    .lineSpacing(8.0)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
