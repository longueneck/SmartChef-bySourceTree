import Foundation

class RecipeViewModel{
    
    private var importView: Ingredient?
    private var ingredientList: [Ingredient] = []
    private var selectedIngredients: [Ingredient] = []
    private var ingredientSearch: [Ingredient] = []
    
    init(){
        ingredientDATA()
    }
    
    //MARK: MOCK
    //Add ingredients to the MOCK list
    
    func ingredientDATA(){
        ingredientList.append(Ingredient(nameIngredient: "Feijão"))
        ingredientList.append(Ingredient(nameIngredient: "Cebola"))
        ingredientList.append(Ingredient(nameIngredient: "Cenoura"))
        ingredientList.append(Ingredient(nameIngredient: "Tomate"))
        ingredientList.append(Ingredient(nameIngredient: "Alho"))
        ingredientList.append(Ingredient(nameIngredient: "Batata"))
        ingredientList.append(Ingredient(nameIngredient: "Salsinha"))
        ingredientList.append(Ingredient(nameIngredient: "Pimentão"))
        ingredientList.append(Ingredient(nameIngredient: "Pimenta-do-reino"))
        ingredientList.append(Ingredient(nameIngredient: "Orégano"))
        ingredientList.append(Ingredient(nameIngredient: "Manjericão"))
        ingredientList.append(Ingredient(nameIngredient: "Queijo parmesão"))
        ingredientList.append(Ingredient(nameIngredient: "Molho de soja"))
        ingredientList.append(Ingredient(nameIngredient: "Azeite de oliva"))
        ingredientList.append(Ingredient(nameIngredient: "Vinagre balsâmico"))
        ingredientList.append(Ingredient(nameIngredient: "Açúcar"))
        ingredientList.append(Ingredient(nameIngredient: "Farinha de trigo"))
        ingredientList.append(Ingredient(nameIngredient: "Fermento em pó"))
        ingredientList.append(Ingredient(nameIngredient: "Ovo"))
        ingredientList.append(Ingredient(nameIngredient: "Leite"))
    }
    
    //-------------------------------------------------------------------------------
    //MARK: : : MAIN LIST : : :
    
    //Return all ingredients from the Main list
    func getAllIngredients() -> [Ingredient]{
        return ingredientList
    }
    
    //Count how many ingredients are inside to the main list
    func countIngredients() -> Int{
        ingredientList.count
    }
    
    //-------------------------------------------------------------------------------
    //MARK: : : SELECTED INGREDIENT LIST : : :
    
    //Add ingredient to selected list
    func addSelectedIngredient(indexPath: IndexPath) {
        selectedIngredients.append(getIngredientSearch[indexPath.row])
    }
    
    //Load some ingredient by index
    func loadCurrentNameIngredient(indexPath: IndexPath) -> String {
        return selectedIngredients[indexPath.row].nameIngredient ?? ""
    }
    
    //Return all of ingredients from selected list
    var getAllSelectedIngredients: [Ingredient] {
        return selectedIngredients
    }
    
    func getAllSelectedIngredientsAsString() -> String {
        return selectedIngredients.map { $0.nameIngredient ?? "" }.joined(separator: ", ")
    }

    
    //Count how many ingredients are inside to the selected list
    func countSelectedIngredients() -> Int{
        selectedIngredients.count
    }
    
    //Delete from index, ingredients inside selected ingredient list
    func deleteSelectedIngredient(index: Int) {
        selectedIngredients.remove(at: index)
    }
    
    //-------------------------------------------------------------------------------
    //MARK: : : SEARCH INGREDIENT LIST : : :
    
    //Add ingredient to search list
    func addIngredientSearch(ingredient: Ingredient) {
        ingredientSearch.append(ingredient)
    }
    
    //Return all of ingredients from selected list
    var getIngredientSearch: [Ingredient] {
        return ingredientSearch
    }
    
    //Load the current ingredient by index
    public func loadCurrentIngredientSearch(indexPath: IndexPath) -> String {
        return ingredientSearch[indexPath.row].nameIngredient ?? ""
    }
    
    //Count how many ingredients are inside the search list
    func countIngredientSearch() -> Int {
        ingredientSearch.count
    }
    
    //delet ingredient by index
    func deleteIngredientSearch(index: Int) {
        ingredientSearch.remove(at: index)
    }
    
    //Filter ingredients from text
    func filterIngredients(with searchText: String) {
        if searchText.isEmpty {
            ingredientSearch = getAllIngredients()
        } else {
            ingredientSearch = getAllIngredients().filter({
                return ($0.nameIngredient ?? "").lowercased().contains(searchText.lowercased())
            })
        }
    }
}
