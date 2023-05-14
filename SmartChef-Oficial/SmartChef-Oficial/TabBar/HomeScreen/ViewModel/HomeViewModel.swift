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
    
    func countRecipes() -> Int{ //Sim
        recipeList.count
    }
    
    public func loadCurrentRecipeSearch(indexPath: IndexPath) -> String { //Sim
        return recipeList[indexPath.row].image
        
    }
    
}

