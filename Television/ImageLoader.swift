//
//  ImageLoader.swift
//  Television
//
//  Created by John Canelis on 5/10/21.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadImage(url: URL) {
        URLSession.shared.dataTask(with: url)  { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
