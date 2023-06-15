import Foundation

protocol ViewModelDelegate: AnyObject {
    func selectedSegmentIndexChanged(to index: Int)
}

class HomeViewModel {
    
    
    weak var delegate: ViewModelDelegate?
    
    var firstPharse = "Gere para mim uma receita para "
    var finalRequestPharse = "Gere para mim uma receita para "
    var withIngredients = "com os seguintes ingredientes "
    private var screen: HomeScreen?
    private var importView: Ingredient?
    private var ingredientList: [Ingredient] = []
    private var selectedIngredients: [Ingredient] = []
    private var ingredientSearch: [Ingredient] = []
    private var selectedSegmentControlIndex: Int = 0
    public var callAlertControllError: ((Error) -> Void)?
    
    public func ingredientDATA() {
        let productsFromAPI = ProductsAPI()
        productsFromAPI.getAllProducts { [weak self] recipes, error in
            if error == nil {
                guard let recipes = recipes else { return }
                for recipe in recipes {
                    guard let name = recipe.name else { return }
                    self?.ingredientList.append(Ingredient(name: name))
                }
            } else {
                self?.callAlertControllError?(error!)
            }
        }
    }
    
    public func getAllIngredients() -> [Ingredient] {
        return ingredientList
    }
    
    public func countIngredients() -> Int {
        return ingredientList.count
    }
    
    public func addSelectedIngredient(indexPath: IndexPath) {
        selectedIngredients.append(ingredientSearch[indexPath.row])
    }
    
    public func loadCurrentNameIngredient(indexPath: IndexPath) -> String {
        return selectedIngredients[indexPath.row].name ?? ""
    }
    
    var getAllSelectedIngredients: [Ingredient] {
        return selectedIngredients
    }
    
    func getAllSelectedIngredientsAsString() -> String {
        let ingredients = selectedIngredients.map { $0.name ?? "" }.joined(separator: ", ")
        return ingredients
    }
    
    func countSelectedIngredients() -> Int {
        return selectedIngredients.count
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
    
    func loadCurrentIngredientSearch(indexPath: IndexPath) -> String {
        return ingredientSearch[indexPath.row].name ?? ""
    }
    
    func countIngredientSearch() -> Int {
        return ingredientSearch.count
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

    public func setNumberOfPeople(number: String)-> String {
        return number
        
    }
    
}
