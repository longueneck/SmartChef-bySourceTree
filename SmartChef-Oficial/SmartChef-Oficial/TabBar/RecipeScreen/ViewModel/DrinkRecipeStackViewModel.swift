import Foundation

class DrinkRecipeStackViewModel{
    
    private var importView: HomeViewModel = HomeViewModel()
    private var drinkRecipeList: [Recipe] = []
    private var selectedDrinkRecipe: [Drink] = []
    private var drinkRecipeSearch: [Drink] = []
    
    init(){
        loadDrinkRecipe()
    }
    
    func loadDrinkRecipe(){
        
        drinkRecipeList =
        [
            Recipe.init(image: "limonada", name: "Limonada", ingredients: ["Agua", "Limao"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
            Recipe.init(image: "refrigerante", name: "Suco de Laranja", ingredients: ["Agua", "Laranja"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
            Recipe.init(image: "expresso", name: "Suco de Morango", ingredients: ["Agua", "Morango"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
            Recipe.init(image: "suco", name: "Suco de Uva", ingredients: ["Agua", "Uva"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
        ]
    }
    
    func getAllDrinkRecipes(index: Int) -> Recipe{
        return drinkRecipeList[index]
    }
    
    func countDrinkRecipes() -> Int{
        drinkRecipeList.count
    }
}
