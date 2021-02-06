import Foundation


struct Product: Codable {
    let body, title, userID: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case body, title
        case userID = "userId"
        case id
    }
}
