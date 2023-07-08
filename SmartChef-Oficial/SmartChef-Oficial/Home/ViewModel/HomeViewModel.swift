import Foundation

protocol ViewModelDelegate: AnyObject {
    func selectedSegmentIndexChanged(to index: Int)
}

class HomeViewModel {
    
    
    weak var delegate: ViewModelDelegate?
    
   
    private var screen: HomeScreen?
    private var importView: IngredientFromAPI?
    private var ingredientList: [IngredientFromAPI] = []
    private var selectedIngredients: [IngredientFromAPI] = []
    private var ingredientSearch: [IngredientFromAPI] = []
    private var selectedSegmentControlIndex: Int = 0
    public var callAlertControllError: ((Error) -> Void)?
    
    var firstPharse: String = .generatePharse
    var withIngredients: String = .withIngredients
    
    public func ingredientDATA() {
        let productsFromAPI = ProductsAPI()
        productsFromAPI.getAllIngredientsFromAPI { [weak self] recipes, error in
            if error == nil {
                guard let recipes = recipes else { return }
                for recipe in recipes {
                    guard let name = recipe.name else { return }
                    self?.ingredientList.append(IngredientFromAPI(name: name))
                }
            } else {
                self?.callAlertControllError?(error!)
            }
        }
    }
    
    public func getAllIngredients() -> [IngredientFromAPI] {
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
    
    var getAllSelectedIngredients: [IngredientFromAPI] {
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
    
    func addIngredientSearch(ingredient: IngredientFromAPI) {
        ingredientSearch.append(ingredient)
    }
    
    var getIngredientSearch: [IngredientFromAPI] {
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
    
    func getSelectedIndexSegmentControl(segmentControl: Int)-> Int {
        return segmentControl + 1
    }
    
    func getSelectedTimeToSlider(time: Int)-> Int {
        let timeInt = Int(time)
        return timeInt
    }
    
    func getTotalPharse(people: Int, time: Int, myIngredients: String,utens: [String])-> String{
        return "\(String.initPharse), \(String.generatePharse) \(people) \(String.pessoas).\(String.withIngredients) \(myIngredients). \(String.timePrepair) \(time) \(String.minutes), tenho estes utensilios da cozinha para usar: \(utens), \(String.continuePharse).\(String.firstRule).\(String.modoDePreparo).\(String.rule1).\(String.forcePharse). \(String.removeIndesejable)"
    }
    
    func setMySwitch(switchOne: Bool, switchTwo: Bool, switchThree: Bool, switchFour: Bool, switchFive: Bool, switchAll: Bool) -> [String] {
        var pharse: [String] = []
        if switchOne == true && switchAll != true {
            pharse.append("Fogão")
        }
        if switchTwo == true && switchAll != true {
            pharse.append("Forno")
        }
        if switchThree == true && switchAll != true {
            pharse.append("Micro-Ondas")
        }
        if switchFour == true && switchAll != true {
            pharse.append("Batedeira")
        }
        if switchFive == true && switchAll != true {
            pharse.append("Liquidificador")
        }
        if switchAll == true {
            pharse.append("Fogão, Forno, Micro-Ondas, Batedeira, Liquidificador")
        }
        
        return pharse
    }
    
    
}
