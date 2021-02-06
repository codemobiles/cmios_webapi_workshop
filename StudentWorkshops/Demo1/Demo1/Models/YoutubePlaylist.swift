// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let youtubePlaylist = try? newJSONDecoder().decode(YoutubePlaylist.self, from: jsonData)

import Foundation

// MARK: - YoutubePlaylist
struct YoutubePlaylist: Codable {
    let youtubes: [Youtube]?
    let error: Bool?
    let errorMsg: String?

    enum CodingKeys: String, CodingKey {
        case youtubes, error
        case errorMsg
    }
}

// MARK: - Youtube
struct Youtube: Codable {
    let id, title, subtitle: String?
    let avatarImage: String?
    let youtubeImage: String?

    enum CodingKeys: String, CodingKey {
        case id, title, subtitle
        case avatarImage = "avatar_image"
        case youtubeImage = "youtube_image"
    }
}
