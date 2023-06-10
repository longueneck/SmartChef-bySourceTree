import UIKit

class HomeViewModel {
    
    private var importView: Recipes?
    private var recipeList: [Recipes] = []
    private var selectedRecipe: [Recipes] = []
    private var recipeSearch: [Recipes] = []
    var hotRecipes: [Recipes] = []
    
    init(){
        let loadDataAPI = LoadDataAPI()
        hotRecipes = loadDataAPI.loadRecipesData()
    }
    
    func countRecipes() -> Int {
        hotRecipes.endIndex
    }
    
    public func loadCurrentRecipeSearch(indexPath: IndexPath) -> String {
        return hotRecipes[indexPath.row].image
    }
    
    func generateRandomRecipes() -> [Recipes] {
        var randomRecipes: Set<Recipes> = []
        
        while randomRecipes.count < 5 {
            if let randomElement = hotRecipes.randomElement() {
                randomRecipes.insert(randomElement)
            }
        }
        return Array(randomRecipes)
    }
    
    public func getRecipe(indexPath: IndexPath) -> Recipes {
        return hotRecipes[indexPath.row]
    }
}

