
import Foundation

struct Model: Codable {
    var data: [Data]?
    var view: [String]?
}
struct Data: Codable {
    var name : String?
    var data : EndData?
}

struct EndData: Codable {
    var text: String?
    var url: String?
    var selectedId: Int?
    var variants: [Variants]?
}

struct Variants: Codable {
    var id: Int?
    var text: String?
}
