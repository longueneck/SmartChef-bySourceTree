import Foundation

class HomeViewModel{
    
    private var importView: Recipe?
    private var recipeList: [Recipe] = []
    private var selectedRecipe: [Recipe] = []
    private var recipeSearch: [Recipe] = []
    
    init(){
        recipeDATA()
    }
    
    func recipeDATA(){
        
        recipeList.append(Recipe(image: "pizza.jpg", name: "Pizza de Frango", ingredients: ["Frango", "Queijo", "Presunto"], time: 35, prepair: "Misture tudo, jogue no forno e espere ficar pronta"))
        recipeList.append(Recipe(image: "feijoada.jpg", name: "Feijoada", ingredients: ["Feijao", "Calabresa", "Bacon"], time: 100, prepair: "Misture tudo, jogue na panela de pressao e espere ficar pronta"))
        recipeList.append(Recipe(image: "paodequeijo.jpg", name: "Pão de Queijo", ingredients: ["Queijo", "Polvilho", "Presunto"], time: 25, prepair: "Misture tudo, jogue no forno e espere ficar pronta"))
        recipeList.append(Recipe(image: "lasanha.jpg", name: "Pão de Queijo", ingredients: ["Queijo", "Polvilho", "Presunto"], time: 25, prepair: "Misture tudo, jogue no forno e espere ficar pronta"))
        recipeList.append(Recipe(image: "costela.jpg", name: "Pão de Queijo", ingredients: ["Queijo", "Polvilho", "Presunto"], time: 25, prepair: "Misture tudo, jogue no forno e espere ficar pronta"))
        recipeList.append(Recipe(image: "coxinha.jpg", name: "Pão de Queijo", ingredients: ["Queijo", "Polvilho", "Presunto"], time: 25, prepair: "Misture tudo, jogue no forno e espere ficar pronta"))
    }
    
    func getAllRecipes() -> [Recipe]{
        return recipeList
    }
    
    func countRecipes() -> Int{
        recipeList.count
    }
    
    func addSelectedIngredient(indexPath: IndexPath) {
        selectedRecipe.append(getRecipeSearch[indexPath.row])
    }
    
    func loadCurrentNameIngredient(indexPath: IndexPath) -> String {
        return selectedRecipe[indexPath.row].name
    }
    
    var getAllSelectedRecipe: [Recipe] {
        return selectedRecipe
    }
    
    func countSelectedRecipe() -> Int{
        selectedRecipe.count
    }
    
    func deletSelectedRecipe(index: Int) {
        selectedRecipe.remove(at: index)
    }
    
    func addRecipeSearch(ingredient: Recipe) {
        recipeSearch.append(ingredient)
    }
    
    var getRecipeSearch: [Recipe] {
        return recipeSearch
    }
    
    public func loadCurrentRecipeSearch(indexPath: IndexPath) -> String {
        return recipeList[indexPath.row].image   }
    
    func countRecipeSearch() -> Int {
        recipeSearch.count
    }
    
    func deleteRecipeSearch(index: Int) {
        recipeSearch.remove(at: index)
    }
    
    func filterIngredients(with searchText: String) {
        if searchText.isEmpty {
            recipeSearch = getAllRecipes()
        } else {
            recipeSearch = getAllRecipes().filter({
                return ($0.name).lowercased().contains(searchText.lowercased())
            })
        }
    }
}

