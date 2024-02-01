

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

//    func loadImage(from url: URL, imageView: UIImageView) {
//        if let cashedResponce = URLCache.shared.cachedResponse(for: URLRequest(url: url)),
//           let image = UIImage(data: cashedResponce.data) {
//            imageView.image = image
//        } else {
//            AF.request(url).responseData { responce in
//                switch responce.result{
//                case .success(let imageData):
//                    if let image = UIImage(data: imageData),
//                       let httpResponce = responce.response {
//                        let cachedData = CachedURLResponse(response: httpResponce, data: imageData)
//                        URLCache.shared.storeCachedResponse(cachedData, for: URLRequest(url: url))
//
//                        DispatchQueue.main.async {
//                            imageView.image = image
//                        }
//                    }
//
//                case .failure(let error):
//                    print("Error: \(error)")
//                    DispatchQueue.main.async {
//                        imageView.image = UIImage(named: "нет карты")
//                    }
//                }
//            }
//        }
//    }
}
