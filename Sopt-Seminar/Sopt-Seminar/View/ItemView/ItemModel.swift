
import UIKit

struct ItemModel {
    
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel( name: "류희재", price: "22000원", heartIsSelected: false),
        ]
    }
}
