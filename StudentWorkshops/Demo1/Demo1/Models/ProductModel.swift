import Foundation


struct Product: Codable {
    let body, title: String?
    let id, userID: Int?

    enum CodingKeys: String, CodingKey {
        case body, title
        case userID = "userId"
        case id
    }
}
