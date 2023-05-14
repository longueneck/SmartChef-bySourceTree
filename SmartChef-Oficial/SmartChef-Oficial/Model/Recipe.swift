import Foundation
import UIKit

enum RecipeType {
    case hot
    case breakfast
    case snack
    case dinner
    case candys
}

struct Recipes: Hashable {
    let name: String
    let type: RecipeType
    let description: String
    let image: String
    let timingToCook: String
    let prepareLevel: String
}


  


