import Foundation

struct TextGPTResponseModel: Decodable {

    var choices: [TextGPTResponseChoicesModel]
    
}

struct TextGPTResponseChoicesModel: Decodable {
    
    var message: TextGPTResponseMessagesModel
    
}

struct TextGPTResponseMessagesModel: Decodable {
    
    var content: String
    
}


//{
//    "id": "chatcmpl-7QksKn4c3Aga7tctXeC7cYo8HoXpU",
//    "object": "chat.completion",
//    "created": 1686611072,
//    "model": "gpt-3.5-turbo-0301",
//    "usage": {
//        "prompt_tokens": 17,
//        "completion_tokens": 77,
//        "total_tokens": 94
//    },
//    "choices": [
//        {
//            "message": {
//                "role": "assistant",
//                "content": "2 + 2 é igual a 4. \n\nJá 2! significa 2 fatorial, que é igual a 2 x 1 = 2. \n\nPortanto, a expressão \"2 + 2!\" pode ser reescrita como \"2 + 2 x 1\", que resulta em 4. \n\nResposta: 4."
//            },
//            "finish_reason": "stop",
//            "index": 0
//        }
//    ]
//}
