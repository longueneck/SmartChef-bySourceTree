import Foundation

class RecipeViewModel{
    
    private var importView: Ingredient?
    private var ingredientList: [Ingredient] = []
    private var selectedIngredients: [Ingredient] = []
    private var ingredientSearch: [Ingredient] = []
    
    init(){
        ingredientDATA()
    }
    
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
    
    func getAllIngredients() -> [Ingredient]{
        return ingredientList
    }
    
    func countIngredients() -> Int{
        ingredientList.count
    }
    
    func addSelectedIngredient(indexPath: IndexPath) {
        selectedIngredients.append(getIngredientSearch[indexPath.row])
    }
    
    func loadCurrentNameIngredient(indexPath: IndexPath) -> String {
        return selectedIngredients[indexPath.row].nameIngredient ?? ""
    }
    
    var getAllSelectedIngredients: [Ingredient] {
        return selectedIngredients
    }
    
    func getAllSelectedIngredientsAsString() -> String {
        return selectedIngredients.map { $0.nameIngredient ?? "" }.joined(separator: ", ")
    }
    
    func countSelectedIngredients() -> Int{
        selectedIngredients.count
    }
    
    func deleteSelectedIngredient(index: Int) {
        selectedIngredients.remove(at: index)
    }
    
    func addIngredientSearch(ingredient: Ingredient) {
        ingredientSearch.append(ingredient)
    }
    
    var getIngredientSearch: [Ingredient] {
        return ingredientSearch
    }
    
    public func loadCurrentIngredientSearch(indexPath: IndexPath) -> String {
        return ingredientSearch[indexPath.row].nameIngredient ?? ""
    }
    
    func countIngredientSearch() -> Int {
        ingredientSearch.count
    }
    
    func deleteIngredientSearch(index: Int) {
        ingredientSearch.remove(at: index)
    }
    
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
