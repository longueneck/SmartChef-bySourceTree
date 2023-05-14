import Foundation

class HomeViewModel{
    
    private var importView: Recipes?
    private var recipeList: [Recipes] = []
    private var selectedRecipe: [Recipes] = []
    private var recipeSearch: [Recipes] = []
    var hotRecipes: [Recipes] = []
    
    public var randomRecipes: [Recipes] {
        return generateRandomRecipes()
    }
    
    init(){
        loadRecipesData()
    }
    
    func loadRecipesData(){
        hotRecipes = [
            Recipes(name: "Pizza Margherita", type: .hot, description: "Uma pizza clássica italiana com tomates frescos, queijo muçarela e folhas de manjericão.", image: "pizza_margherita.jpg", timingToCook: "30 minutos", prepareLevel: "Fácil"),
            Recipes(name: "Macarrão à Bolonhesa", type: .hot, description: "Um prato tradicional de massa italiana com um rico molho de carne feito com carne moída, tomates e ervas.", image: "spaghetti_bolognese.jpg", timingToCook: "45 minutos", prepareLevel: "Intermediário"),
            Recipes(name: "Frango à Parmegiana", type: .hot, description: "Peitos de frango empanados cobertos com molho marinara, queijo muçarela e queijo parmesão, depois assados até ficarem dourados e borbulhantes.", image: "chicken_parmesan.jpg", timingToCook: "50 minutos", prepareLevel: "Intermediário"),
            Recipes(name: "Chili de Carne", type: .hot, description: "Um chili substancioso e apimentado feito com carne moída, feijão, tomates e uma mistura de especiarias.", image: "beef_chili.jpg", timingToCook: "1 hora e 30 minutos", prepareLevel: "Avançado"),
            Recipes(name: "Bolo de Chocolate com Recheio Cremoso", type: .hot, description: "Um bolo de chocolate decadente com um centro cremoso de chocolate derretido. Servido quente com uma bola de sorvete de baunilha.", image: "chocolate_lava_cake.jpg", timingToCook: "25 minutos", prepareLevel: "Intermediário"),
            Recipes(name: "Lasanha de Carne", type: .hot, description: "Uma deliciosa lasanha de carne com camadas de macarrão, molho de carne, queijo e molho bechamel.", image: "beef_lasagna.jpg", timingToCook: "1 hora e 15 minutos", prepareLevel: "Avançado"),
            Recipes(name: "Risoto de Cogumelos", type: .hot, description: "Um risoto cremoso e reconfortante preparado com arroz arbóreo, cogumelos frescos, caldo de legumes e queijo parmesão.", image: "mushroom_risotto.jpg", timingToCook: "40 minutos", prepareLevel: "Intermediário"),
            Recipes(name: "Sopa de Tomate", type: .hot, description: "Uma sopa clássica de tomate feita com tomates maduros, cebola, alho e temperos. Perfeita para os dias mais frios.", image: "tomato_soup.jpg", timingToCook: "35 minutos", prepareLevel: "Fácil"),
            Recipes(name: "Pão de Queijo", type: .hot, description: "Uma delícia brasileira, o pão de queijo é feito com polvilho azedo, queijo minas e ovos, assado até ficar crocante por fora e macio por dentro.", image: "pao_de_queijo.jpg", timingToCook: "30 minutos", prepareLevel: "Fácil"),
            Recipes(name: "Feijoada", type: .hot, description: "O prato nacional do Brasil, a feijoada é um ensopado rico e saboroso feito com feijão preto, carne de porco, linguiça, costelinha e diversos acompanhamentos.", image: "feijoada.jpg", timingToCook: "3 horas", prepareLevel: "Avançado"),
            Recipes(name: "Moqueca de Peixe", type: .hot, description: "Um prato típico da culinária brasileira, a moqueca de peixe é um ensopado feito com peixe, leite de coco, dendê, tomate, pimentões e temperos, servido com arroz branco.", image: "moqueca.jpg", timingToCook: "1 hora", prepareLevel: "Intermediário"),
            Recipes(name: "Bobó de Camarão", type: .hot, description: "Um prato tradicional da culinária nordestina brasileira, o bobó de camarão é feito com camarões refogados em um creme de mandioca, leite de coco, dendê e temperos.", image: "bobo_de_camarao.jpg", timingToCook: "1 hora", prepareLevel: "Intermediário"),
            Recipes(name: "Bacalhau à Gomes de Sá", type: .hot, description: "Uma receita clássica de bacalhau portuguesa, o bacalhau à Gomes de Sá é feito com bacalhau dessalgado, batatas, cebolas, azeitonas e azeite, assado até ficar dourado.", image: "bacalhau_gomes_de_sa.jpg", timingToCook: "1 hora e 30 minutos", prepareLevel: "Intermediário"),
            Recipes(name: "Torta de Frango", type: .hot, description: "Uma torta caseira recheada com frango desfiado, legumes, temperos e coberta com uma massa crocante.", image: "chicken_pot_pie.jpg", timingToCook: "1 hora", prepareLevel: "Intermediário"),
            Recipes(name: "Rabanada", type: .hot, description: "Um doce tradicional de Natal, a rabanada é feita com fatias de pão embebidas em uma mistura de leite, ovos e açúcar, fritas até ficarem douradas e polvilhadas com canela.", image: "rabanada.jpg", timingToCook: "30 minutos", prepareLevel: "Fácil"),
        ]
    }
    
    func countRecipes() -> Int{
        hotRecipes.count
    }
    
    public func loadCurrentRecipeSearch(indexPath: IndexPath) -> String {
        return hotRecipes[indexPath.row].image
    }
    
    func generateRandomRecipes() -> [Recipes] {
        var randomRecipes: [Recipes] = []
        
        for i in 1...5 {
            if let randomElement = hotRecipes.randomElement() {
                randomRecipes.append(randomElement)
            }
        }
        return randomRecipes
    }
    
    public func getRecipe(indexPath: IndexPath) -> Recipes {
        return hotRecipes[indexPath.row]
    }
    
}

