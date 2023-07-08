import Foundation

class ImageGPTService {
    
    static var configuration: URLSessionConfiguration{
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/json", "Authorization": APIKey.apiKey ]
        return config
    }
    
    static var session: URLSession = URLSession(configuration: configuration)
    
    static var baseURL = APIConfig.baseImageUrl
    
    public func generateImage(message: String, closure:  @escaping(ImageResponseModel? , APIErrors?) -> Void ) {
        let url = URL(string: ImageGPTService.baseURL)
        guard let url = url else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = .post
        let request = ImageRequestModel(prompt: message)
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
                        let recipe = try jsonDecode.decode(ImageResponseModel.self, from: data)
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