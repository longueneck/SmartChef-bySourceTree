import Foundation

class HomeViewModel{
    
    private var importView: Recipes?
    private var recipeList: [Recipes] = []
    private var selectedRecipe: [Recipes] = []
    private var recipeSearch: [Recipes] = []
    var hotRecipes: [Recipes] = []
    
    init(){
        loadRecipesData()
    }
    
    func loadRecipesData(){
        guard let jsonURL = Bundle.main.url(forResource: "recipesSmart.json", withExtension: "") else {
            print("ERRO PRA RECUPERAR URL")
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            hotRecipes = try JSONDecoder().decode([Recipes].self, from: jsonData)
        }
        catch {
            print("Erro ao decodificar Json: \(error)")
        }
    }
    
    func countRecipes() -> Int{
        hotRecipes.count
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

