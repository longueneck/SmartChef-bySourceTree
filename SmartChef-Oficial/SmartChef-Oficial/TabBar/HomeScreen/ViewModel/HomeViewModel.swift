import Foundation

class HomeViewModel{
    
    private var importView: IngredientsModel?
    private var ingredientList: [IngredientsModel] = []
    private var selectedIngredients: [IngredientsModel] = []
    private var ingredientSearch: [IngredientsModel] = []
    
    init(){
        ingredientDATA()
    }
    
    //MARK: MOCK
    //Add ingredients to the MOCK list
    
    func ingredientDATA(){
        ingredientList.append(IngredientsModel(nameIngredient: "Feijão"))
        ingredientList.append(IngredientsModel(nameIngredient: "Cebola"))
        ingredientList.append(IngredientsModel(nameIngredient: "Cenoura"))
        ingredientList.append(IngredientsModel(nameIngredient: "Tomate"))
        ingredientList.append(IngredientsModel(nameIngredient: "Alho"))
        ingredientList.append(IngredientsModel(nameIngredient: "Batata"))
        ingredientList.append(IngredientsModel(nameIngredient: "Salsinha"))
        ingredientList.append(IngredientsModel(nameIngredient: "Pimentão"))
        ingredientList.append(IngredientsModel(nameIngredient: "Pimenta-do-reino"))
        ingredientList.append(IngredientsModel(nameIngredient: "Orégano"))
        ingredientList.append(IngredientsModel(nameIngredient: "Manjericão"))
        ingredientList.append(IngredientsModel(nameIngredient: "Queijo parmesão"))
        ingredientList.append(IngredientsModel(nameIngredient: "Molho de soja"))
        ingredientList.append(IngredientsModel(nameIngredient: "Azeite de oliva"))
        ingredientList.append(IngredientsModel(nameIngredient: "Vinagre balsâmico"))
        ingredientList.append(IngredientsModel(nameIngredient: "Açúcar"))
        ingredientList.append(IngredientsModel(nameIngredient: "Farinha de trigo"))
        ingredientList.append(IngredientsModel(nameIngredient: "Fermento em pó"))
        ingredientList.append(IngredientsModel(nameIngredient: "Ovo"))
        ingredientList.append(IngredientsModel(nameIngredient: "Leite"))
    }
    
    //-------------------------------------------------------------------------------
    //MARK: : : MAIN LIST : : :
    
    //Return all ingredients from the Main list
    func getAllIngredients() -> [IngredientsModel]{
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
    var getAllSelectedIngredients: [IngredientsModel] {
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
    func addIngredientSearch(ingredient: IngredientsModel) {
        ingredientSearch.append(ingredient)
    }
    
    //Return all of ingredients from selected list
    var getIngredientSearch: [IngredientsModel] {
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
