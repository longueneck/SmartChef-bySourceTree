import Foundation

class TextGPTService {
    
        static var configuration: URLSessionConfiguration{
                let config = URLSessionConfiguration.default
            config.httpAdditionalHeaders = ["Content-Type":"application/json", "Authorization":"Bearer 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"]
            return config
        }
        
        static var session: URLSession = URLSession(configuration: configuration)
        
        static var baseURL = "https://api.openai.com/v1/chat/completions"
        
    public func generateRecipe(message: String, closure:  @escaping(TextGPTResponseModel? , APIErrors?) -> Void ) {
        let url = URL(string: TextGPTService.baseURL)
        guard let url = url else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let textRequest = TextGPTRequestMessagesModel(content: message)
        let request = TextGPTRequestModel(messages: [textRequest])
        let encoder = JSONEncoder()
        let body = try? encoder.encode(request)
        urlRequest.httpBody = body
        let task = TextGPTService.session.dataTask(with: urlRequest) { data, urlResponse, error in
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
                        let recipe = try jsonDecode.decode(TextGPTResponseModel.self, from: data)
                        closure(recipe, nil)
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
