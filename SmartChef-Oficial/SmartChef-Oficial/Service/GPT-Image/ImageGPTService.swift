import Foundation

class ImageGPTService {
    
        static var configuration: URLSessionConfiguration{
                let config = URLSessionConfiguration.default
            config.httpAdditionalHeaders = ["Content-Type":"application/json", "Authorization":"Bearer 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"]
            return config
        }
        
        static var session: URLSession = URLSession(configuration: configuration)
        
        static var baseURL = "https://api.openai.com/v1/images/generations"
        
    public func generateImage(message: String, closure:  @escaping(ImageGPTResponseModel? , APIErrors?) -> Void ) {
        let url = URL(string: ImageGPTService.baseURL)
        guard let url = url else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let request = ImageGPTRequestModel(prompt: message)
        let encoder = JSONEncoder()
        let body = try? encoder.encode(request)
        urlRequest.httpBody = body
        let task = ImageGPTService.session.dataTask(with: urlRequest) { data, urlResponse, error in
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
                        let recipe = try jsonDecode.decode(ImageGPTResponseModel.self, from: data)
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
