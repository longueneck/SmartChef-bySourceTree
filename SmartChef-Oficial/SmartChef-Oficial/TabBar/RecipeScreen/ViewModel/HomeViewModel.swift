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
    
    //Count how many ingredients are inside to the main list
    func countRecipes() -> Int{
        recipeList.count
    }
    
    //-------------------------------------------------------------------------------
    //MARK: : : SELECTED INGREDIENT LIST : : :
    
    //Add recipe to selected list
    func addSelectedIngredient(indexPath: IndexPath) {
        selectedRecipe.append(getRecipeSearch[indexPath.row])
    }
    
    //Load some ingredient by index
    func loadCurrentNameIngredient(indexPath: IndexPath) -> String {
        return selectedRecipe[indexPath.row].name
    }
    
    //Return all of ingredients from selected list
    var getAllSelectedRecipe: [Recipe] {
        return selectedRecipe
    }
    
    //Count how many ingredients are inside to the selected list
    func countSelectedRecipe() -> Int{
        selectedRecipe.count
    }
    
    //Delete from index, ingredients inside selected ingredient list
    func deletSelectedRecipe(index: Int) {
        selectedRecipe.remove(at: index)
    }
    
    //-------------------------------------------------------------------------------
    //MARK: : : SEARCH RECIPE LIST : : :
    
    //Add ingredient to search list
    func addRecipeSearch(ingredient: Recipe) {
        recipeSearch.append(ingredient)
    }
    
    //Return all of ingredients from selected list
    var getRecipeSearch: [Recipe] {
        return recipeSearch
    }
    
    //Load the current ingredient by index
    public func loadCurrentRecipeSearch(indexPath: IndexPath) -> String {
        return recipeList[indexPath.row].image   }
    
    //Count how many ingredients are inside the search list
    func countRecipeSearch() -> Int {
        recipeSearch.count
    }
    
    //delet ingredient by index
    func deleteRecipeSearch(index: Int) {
        recipeSearch.remove(at: index)
    }
    
    //Filter ingredients from text
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

