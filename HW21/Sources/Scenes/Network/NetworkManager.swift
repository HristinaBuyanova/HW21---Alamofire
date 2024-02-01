
import Foundation
import Alamofire

final class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func fetchCard(completion: @escaping ([ParametrCard]?) -> Void) {
        let request = AF.request("https://api.magicthegathering.io/v1/cards")
        request.responseDecodable(of: MagicCards.self) { response in
            switch response.result {
            case .success(let success):
                completion(success.cards)
            case .failure(let failure):
                print("Error: \(failure)")
                completion(nil)
            }
        }
    }
}
