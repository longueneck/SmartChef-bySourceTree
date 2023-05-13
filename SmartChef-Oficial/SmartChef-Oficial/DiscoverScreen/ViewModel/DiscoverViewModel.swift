import Foundation

class DiscoverViewModel{
   
    var selectedIngredients: String?

    private var importView: RecipeModel?
    private var recipeList: [RecipeModel] = []
    private var selectedRecipe: [RecipeModel] = []
    private var recipeSearch: [RecipeModel] = []
    
    init(selectedIngredients: String?) {
            self.selectedIngredients = selectedIngredients
    }
    
    func getSelectedOtherView() -> String?{
        return selectedIngredients
    }
    
    func count() -> Int?{
        return selectedIngredients?.count
    }
    
    func searchRecipes() -> [RecipeModel] {
        guard let selectedIngredients = self.selectedIngredients else {
            return []
        }
        
        let selectedIngredientsList = selectedIngredients.lowercased().components(separatedBy: ",")
    
        let filteredRecipes = recipeList.filter { recipe in
            let recipeIngredients = recipe.ingredients.map { $0.lowercased() }
            return selectedIngredientsList.allSatisfy(recipeIngredients.contains)
        }
        
        return filteredRecipes
    }
   
}


