//
//  Content.swift
//  Television
//
//  Created by John Canelis on 5/10/21.
//

import Foundation
import Contentful

let contentTypeClassess: [EntryDecodable.Type] = [
    Product.self
]

let client = Client(
    spaceId: ProcessInfo.processInfo.environment["contentful_space_id"]!,
    environmentId: ProcessInfo.processInfo.environment["contentful_environment"]!,
    accessToken: ProcessInfo.processInfo.environment["contentful_api_key"]!,
    contentTypeClasses: contentTypeClassess)

final class Product: EntryDecodable, FieldKeysQueryable, Identifiable {
    
    static let contentTypeId: String = "product"
    
    let id: String
    let localeCode: String?
    let updatedAt: Date?
    let createdAt: Date?
    
    // var photos: Array<Link>?
    var mainPhoto: Asset?
    let title: String?
    let description: String?
    let price: Int?
    
    public required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()
        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt
        
        let fields      = try decoder.contentfulFieldsContainer(keyedBy: Product.FieldKeys.self)
        self.title      = try fields.decodeIfPresent(String.self, forKey: .title)
        self.price      = try fields.decodeIfPresent(Int.self, forKey: .price)
        self.description      = try fields.decodeIfPresent(String.self, forKey: .description)
        
        try fields.resolveLink(forKey: .mainPhoto, decoder: decoder) { [weak self] image in
            self?.mainPhoto = image as? Asset
        }
    }
    
    enum FieldKeys: String, CodingKey {
        case mainPhoto, title, price, description
    }
}
