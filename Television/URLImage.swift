//
//  URLImage.swift
//  Television
//
//  Created by John Canelis on 5/10/21.
//

import SwiftUI

struct URLImage: View {
    let url: URL
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: URL, placeholder: String = "aqi.high"){
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable().aspectRatio(contentMode: .fill)
        } else {
            return Image(systemName: "photo").resizable().aspectRatio(contentMode: .fit)
        }
    }
}


//struct URLImage_Previews: PreviewProvider {
//    static var previews: some View {
//        URLImage()
//    }
//}
