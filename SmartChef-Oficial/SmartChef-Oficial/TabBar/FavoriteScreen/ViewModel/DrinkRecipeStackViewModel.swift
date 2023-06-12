import UIKit

class DrinkRecipeStackViewModel{
    
    private var importView: NewFavoriteViewModel = NewFavoriteViewModel()
    private var drinkRecipeList: [Drink] = []
    private var selectedDrinkRecipe: [Drink] = []
    private var drinkRecipeSearch: [Drink] = []
    
    init(){
        loadDrinkRecipe()
    }
    
    func loadDrinkRecipe(){
        
        drinkRecipeList =
        [
            Drink.init(image: "limonada", name: "Limonada", ingredients: ["Agua", "Limao"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
            Drink.init(image: "refrigerante", name: "Suco de Laranja", ingredients: ["Agua", "Laranja"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
            Drink.init(image: "expresso", name: "Suco de Morango", ingredients: ["Agua", "Morango"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
            Drink.init(image: "suco", name: "Suco de Uva", ingredients: ["Agua", "Uva"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
        ]
    }
    
    func getAllDrinkRecipes(index: Int) -> Drink{
        return drinkRecipeList[index]
    }
    
    func countDrinkRecipes() -> Int{
        drinkRecipeList.endIndex
    }
}
