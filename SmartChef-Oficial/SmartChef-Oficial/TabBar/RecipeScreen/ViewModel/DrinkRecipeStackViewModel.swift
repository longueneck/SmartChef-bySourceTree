import Foundation

class DrinkRecipeStackViewModel{
    
    private var importView: RecipeViewModel = RecipeViewModel()
    private var drinkRecipeList: [RecipeModel] = []
    private var selectedDrinkRecipe: [DrinkModel] = []
    private var drinkRecipeSearch: [DrinkModel] = []
    
    init(){
        loadDrinkRecipe()
    }
    
    //MARK: MOCK
    //Add ingredients to the MOCK list
    
    func loadDrinkRecipe(){
        
        drinkRecipeList =
    [
        RecipeModel.init(image: "limonada", name: "Limonada", ingredients: ["Agua", "Limao"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
        RecipeModel.init(image: "refrigerante", name: "Suco de Laranja", ingredients: ["Agua", "Laranja"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
        RecipeModel.init(image: "expresso", name: "Suco de Morango", ingredients: ["Agua", "Morango"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
        RecipeModel.init(image: "suco", name: "Suco de Uva", ingredients: ["Agua", "Uva"], time: 5, prepair: "Esprema o limao adicione a agua e beba"),
    ]
    }
    
    //-------------------------------------------------------------------------------
    //MARK: : : MAIN RECIPE LIST : : :
    
    func getAllDrinkRecipes(index: Int) -> RecipeModel{
        return drinkRecipeList[index]
    }
    
    func countDrinkRecipes() -> Int{
        drinkRecipeList.count
    }

//    func loadCurrentImageDrinkRecipe(index: Int) -> [RecipeModel] {
//        return drinkRecipeList[]
//    }
    
}
