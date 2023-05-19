import Foundation

enum RecipeType: String, Codable {
    case hot = "hot"
    case breakfast = "breakfast"
    case snack = "snack"
    case dinner = "dinner"
    case candys = "candys"
}

struct Recipes: Codable, Hashable {
    let name: String
    let type: RecipeType
    let description: String
    let image: String
    let ingredients: [String]
    let amount: [String]
    let portion: String
    let prepareMode: String
    let timingToCook: String
    let prepareLevel: String
}
