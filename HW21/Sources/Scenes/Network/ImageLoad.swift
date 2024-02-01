

import Foundation
import Alamofire

class ImageLoad {
    static let shared = ImageLoad()
    
    private init() {}

    func loadImage (from urlString: String, complition: @escaping (Result<Data?, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error {
                complition(.failure(error))
            }
            complition(.success(data))
        }
        task.resume()
    }
}
