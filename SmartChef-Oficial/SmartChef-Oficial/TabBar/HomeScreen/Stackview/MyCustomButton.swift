import UIKit

enum ScreensTypeOfRecipe{
    
    case recipeType1
    case recipeType2
    case recipeType3
    case recipeType4
    case recipeType5
    
  
    }
    

class MyCustomButton: UIButton{
  
    var screen: ScreensTypeOfRecipe = .recipeType1
    
}

