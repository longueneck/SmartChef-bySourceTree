import Foundation

protocol ViewModelDelegate: AnyObject {
    func selectedSegmentIndexChanged(to index: Int)
}

class HomeViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    
    private var screen: HomeScreen?
    private var importView: Ingredient?
    private var ingredientList: [Ingredient] = []
    private var selectedIngredients: [Ingredient] = []
    private var ingredientSearch: [Ingredient] = []
    public var callAlertControllError: ((Error) -> Void)?
    private var selectedSegmentControlIndex: Int = 0
    
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
        return selectedIngredients.map { $0.name ?? "" }.joined(separator: ", ")
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
    
//    func segmentedControlValueChanged(selectedIndex: Int) {
//            self.selectedIndex = selectedIndex
//            
//            // Faça algo com o índice selecionado
//            print("Índice selecionado: \(selectedIndex)")
//        }
//    
//    func segmentedControlValueChanged(selectedIndex: Int) {
//            switch selectedIndex {
//            case 0:
//                // Índice 0 selecionado
//                print("Número 1")
//            case 1:
//              
//                print("Número 2")
//            case 2:
//                // Índice 2 selecionado
//                print("Número 3")
//            default:
//                break
//            }
//        }
    

//    
//    
//    func selectedPeopleCount() -> Int {
//        guard let selectedSegmentIndex = screen?.manyPeopleSegmentedControl.selectedSegmentIndex else { return 0 }
//        return selectedSegmentIndex + 1
//    }
    
    
    
//    var choice: String {
//        if let screen = screen {
//            if screen.mySwitch1.isOn {
//                return MyKitchenHave.fogao.rawValue
//            } else if screen.mySwitch2.isOn {
//                return MyKitchenHave.forno.rawValue
//            } else if screen.mySwitch3.isOn {
//                return MyKitchenHave.batedeira.rawValue
//            } else if screen.mySwitch4.isOn {
//                return MyKitchenHave.liquidificador.rawValue
//            }
//        }
//
//        return ""
//    }
//
//    var baseScript = "Gere uma receita da culinaria com estes ingredientes:"
//    var secondScript = "Tenho apenas:"
//    var manyPeople = "Receita para"
//    var withThis = "Com estes eletrodomesticos de cozinha"
//
//    var time = 30
//    var quantity = 2
//
//
//
//

    
}
