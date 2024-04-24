import UIKit
struct ChatModel {
    
    let name: String
    let place: String
    let message: String
 
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel( name: "1류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "2류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "3류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "4류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "5류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "6류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "7류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "8류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "9류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "10류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "11류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "12류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "13류희재", place: "성북구", message: "땡큐"),
            ChatModel( name: "14류희재", place: "성북구", message: "땡큐"),

        ]
    }
}
