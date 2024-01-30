
import Foundation

struct MagicCards: Codable {
    let cards: [ParametrCard]
}

struct ParametrCard: Codable {
    let name: String
    let type: String
    let cmc: Int
    let rarity: String
    let artist: String
    let id: String
    let text: String
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case name, type, cmc, rarity, artist, id, text
        case imageURL = "imageUrl"
        }
}
