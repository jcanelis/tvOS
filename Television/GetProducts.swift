//
//  GetProducts.swift
//  Television
//
//  Created by John Canelis on 5/10/21.
//

import Foundation
import Contentful

class GetProducts: ObservableObject {
    
    @Published var products: [Product] = []
    
    func getProducts() -> Void {
        client.fetchArray(of: Product.self) { (result: Result<HomogeneousArrayResponse<Product>, Error>) in
            switch result {
            case .success(let productsResponse):
                let response = productsResponse.items
                DispatchQueue.main.async {
                    self.products = response
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getAsset() -> Void {
        client.fetch(Asset.self, id: "kSbdpKtk27WcksWdqoOET") { (result: Result<Asset, Error>) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print("Error \(error)!")
            }
        }
    }
    
    func getEntry() -> Void {
        client.fetch(Entry.self, id: "4nkTIB4roIryyaAxaW1n2B") { (result: Result<Entry, Error>) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print("Error \(error)!")
            }
        }
    }
    
}
