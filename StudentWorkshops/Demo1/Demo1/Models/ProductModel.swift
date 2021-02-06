// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let product = try? newJSONDecoder().decode(Product.self, from: jsonData)

import Foundation

// MARK: - Product
struct Product: Codable {
    let body, title, userID: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case body, title
        case userID
        case id
    }
}
