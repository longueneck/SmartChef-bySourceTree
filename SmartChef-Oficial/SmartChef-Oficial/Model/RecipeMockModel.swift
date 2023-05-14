import Foundation

enum RecipesType {
    case hot
    case breakfast
    case snack
    case dinner
    case candys
}

struct RecipesMock {
    let name: String
    let type: RecipesType
    let description: String
    let image: String
    let timingToCook: String
    let prepareLevel: String
}
