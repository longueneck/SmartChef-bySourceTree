import UIKit

class RecipeViewModel{
    
    private var importView: Ingredient?
    private var ingredientList: [Ingredient] = []
    private var selectedIngredients: [Ingredient] = []
    private var ingredientSearch: [Ingredient] = []
    public var callAlertControllError: ((Error) -> Void)?
    
    init(){
        
    }
    
    func ingredientDATA(){
        
        let productsFromAPI = ProductsAPI()
        productsFromAPI.getAllProducts { [weak self]recipes, error in
            if error == nil{
                guard let recipes = recipes else {return}
                for recipe in recipes{
                    guard let name = recipe.name else {return}
                    self?.ingredientList.append(Ingredient(name: name))
                }
            }else{
                self?.callAlertControllError?(error!)
            }
        }
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
        return selectedIngredients[indexPath.row].name ?? ""
    }
    
    var getAllSelectedIngredients: [Ingredient] {
        return selectedIngredients
    }
    
    func getAllSelectedIngredientsAsString() -> String {
        return selectedIngredients.map { $0.name ?? "" }.joined(separator: ", ")
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
        return ingredientSearch[indexPath.row].name ?? ""
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
            ingredientSearch = getAllIngredients().filter { ingredient in
                let name = ingredient.name?.lowercased() ?? ""
                let searchTextWithoutDiacritics = searchText.folding(options: .diacriticInsensitive, locale: .current).lowercased()
                
                return name.localizedStandardContains(searchTextWithoutDiacritics)
            }
        }
    }
}
