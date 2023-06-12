import UIKit

class PrepairViewModel{
   
    var selectedIngredients: String?
    
    
    init(selectedIngredients: String?) {
            self.selectedIngredients = selectedIngredients
    }
    
    func selectedArray() -> [String]? {
        return selectedIngredients?.lowercased().components(separatedBy: ",")
    }
    
    func getSelectedOtherView() -> String? {
        return selectedIngredients
    }
    
    func count() -> Int?{
        return selectedIngredients?.count
    }

    
   
}


