import Foundation
import Combine

class ProductVM: ObservableObject{
    @Published var products = [ProductListModel]()
}

extension ProductVM{
    // MARK: - Intents
    
    func jsonParse(from url: String){
        let url = URL(string: url)
        URLSession.shared.dataTaskPublisher(for: url!)
            .map { $0.data }
            .decode(type: [ProductListModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: &$products)
    }
}

