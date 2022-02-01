import Foundation

struct ProductListModel: Codable {
    
    let product_name: String
    let brand_name: String
    let price: Double
    let address: Address
    let discription: String
    let date: String
    let time: String
    let image: String
    
    struct Address: Codable {
        let state: String
        let city: String
    }
}

