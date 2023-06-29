import Foundation

class LoadDataAPI {
    
    func loadRecipesData() -> [Recipes] {
        guard let jsonURL = Bundle.main.url(forResource: "recipesSmart.json", withExtension: "") else {
            print("ERRO PRA RECUPERAR URL")
            return []
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            return try JSONDecoder().decode([Recipes].self, from: jsonData)
        }
        catch {
            print("Erro ao decodificar Json: \(error)")
            return []
        }
    }
}
