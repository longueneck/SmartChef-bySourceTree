import UIKit

enum APIErrors: Error{
    
    case urlPharse(String)
    case converterResponse(String)
    case errorData(String)
    case statuCcode(Int)
    case unknow(Error)
    
}

class ProductsAPI{
    
    private let productsURL = "ingredient"
    
    func getAllIngredientsFromAPI(closure: @escaping([IngredientFromAPI]? , APIErrors?) -> Void ){
        guard let url = URL(string: "\(StaticSession.baseURL)\(productsURL)") else {
            closure(nil, APIErrors.urlPharse("ERRO DE URL"))
            return
    }
        
        let task = StaticSession.session.dataTask(with: url) { (data, urlResponse, error) in
            if error == nil {
                guard let response = urlResponse as? HTTPURLResponse else {
                    closure(nil, APIErrors.converterResponse("Erro na conversão response"))
                    return
                }
                if response.statusCode == 200{
                    guard let data = data else {
                        closure(nil, APIErrors.errorData("DATA ERROR"))
                        return}
                    do{
                        let jsonDecode = JSONDecoder()
                        let ingredients = try jsonDecode.decode([IngredientFromAPI].self, from: data)
                        closure(ingredients, nil)
                    }catch{
                        closure(nil, APIErrors.unknow(error))
                    }
                 
                    
                }else{
                    closure(nil, APIErrors.statuCcode(response.statusCode))
                }
                
            }else{
                closure(nil, APIErrors.unknow(error!))
            }
        }
        task.resume()
    }
    
    
    
}
